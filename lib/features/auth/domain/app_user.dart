import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

enum AuthMethod { phone, email, google }

/// The signed-in account, independent of the auth backend.
@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String uid,
    required AuthMethod method,
    String? phoneNumber,
    String? email,
    String? displayName,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
