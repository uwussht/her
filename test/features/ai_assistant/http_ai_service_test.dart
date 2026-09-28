import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:her_circle/features/ai_assistant/data/http_ai_service.dart';
import 'package:her_circle/features/ai_assistant/domain/ai_context.dart';
import 'package:her_circle/features/ai_assistant/domain/ai_service.dart';
import 'package:her_circle/features/ai_assistant/domain/chat_message.dart';

void main() {
  const request = AiChatRequest(
    message: 'What cycle length is normal?',
    userContext: AiUserContext(
      ageGroup: '25-34',
      stage: 'trackingCycle',
      cycleDay: 9,
      language: 'ru',
    ),
  );

  HttpAiService serviceWith(_FakeAdapter adapter) {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'))
      ..httpClientAdapter = adapter;
    return HttpAiService(baseUrl: 'https://example.test', dio: dio);
  }

  test('posts the documented body to /ai/chat', () async {
    final adapter = _FakeAdapter(
      body: {
        'reply': 'Usually 24-38 days.',
        'references': [
          {'kind': 'lesson', 'id': 'c_cycle_phases'},
        ],
        'emergency': false,
      },
    );
    final response = await serviceWith(adapter).chat(request);

    expect(adapter.path, HttpAiService.path);
    expect(adapter.sentBody, {
      'message': 'What cycle length is normal?',
      'userContext': {
        'ageGroup': '25-34',
        'stage': 'trackingCycle',
        'cycleDay': 9,
        'pregWeek': null,
        'language': 'ru',
      },
    });
    expect(response.reply, 'Usually 24-38 days.');
    expect(
      response.references.single,
      const ChatReference(kind: ReferenceKind.lesson, id: 'c_cycle_phases'),
    );
  });

  test('reads the emergency flag the backend sets', () async {
    final response = await serviceWith(
      _FakeAdapter(body: {'reply': 'Call 103.', 'emergency': true}),
    ).chat(request);
    expect(response.emergency, isTrue);
  });

  test('maps transport problems to reasons the UI can explain', () async {
    Future<AiFailureReason> reasonFor(_FakeAdapter adapter) async {
      try {
        await serviceWith(adapter).chat(request);
      } on AiFailure catch (failure) {
        return failure.reason;
      }
      fail('expected an AiFailure');
    }

    expect(
      await reasonFor(_FakeAdapter(status: 429, body: const {})),
      AiFailureReason.rateLimited,
    );
    expect(
      await reasonFor(_FakeAdapter(status: 500, body: const {})),
      AiFailureReason.server,
    );
    expect(
      await reasonFor(_FakeAdapter(type: DioExceptionType.connectionError)),
      AiFailureReason.network,
    );
    expect(
      await reasonFor(_FakeAdapter(type: DioExceptionType.receiveTimeout)),
      AiFailureReason.timeout,
    );
  });
}

/// Answers Dio without a network, and records what was sent.
class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter({this.body, this.status = 200, this.type});

  final Map<String, dynamic>? body;
  final int status;

  /// When set, the request fails with this Dio error instead of answering.
  final DioExceptionType? type;

  String? path;
  Map<String, dynamic>? sentBody;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    path = options.path;
    sentBody = options.data as Map<String, dynamic>?;
    if (type != null) {
      throw DioException(requestOptions: options, type: type!);
    }
    return ResponseBody.fromString(
      jsonEncode(body ?? const <String, dynamic>{}),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
