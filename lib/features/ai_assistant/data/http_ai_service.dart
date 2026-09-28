import 'package:dio/dio.dart';

import '../domain/ai_service.dart';

/// Talks to our FastAPI proxy.
///
/// The proxy holds the model provider's key and the system prompt, so the app
/// ships with no secret and the safety rules cannot be edited by unpacking
/// the APK. Point it at a build with `--dart-define=AI_BASE_URL=...`.
class HttpAiService implements AiService {
  HttpAiService({required String baseUrl, Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 30),
              contentType: Headers.jsonContentType,
            ),
          );

  final Dio _dio;

  static const String path = '/ai/chat';

  @override
  Future<AiChatResponse> chat(AiChatRequest request) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        path,
        data: request.toJson(),
      );
      final data = response.data;
      if (data == null) throw const AiFailure(AiFailureReason.server);
      return AiChatResponse.fromJson(data);
    } on DioException catch (error) {
      throw AiFailure(_reasonFor(error), error.message);
    } on AiFailure {
      rethrow;
    } catch (error) {
      throw AiFailure(AiFailureReason.unknown, error.toString());
    }
  }

  static AiFailureReason _reasonFor(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout => AiFailureReason.timeout,
      DioExceptionType.connectionError => AiFailureReason.network,
      DioExceptionType.badResponse =>
        error.response?.statusCode == 429
            ? AiFailureReason.rateLimited
            : AiFailureReason.server,
      _ => AiFailureReason.unknown,
    };
  }
}
