import 'package:freezed_annotation/freezed_annotation.dart';

import 'personalization.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// Personalization answers. Stored in the encrypted local store, since the
/// last period date is health data.
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required AgeGroup ageGroup,
    required LifeStage lifeStage,
    DateTime? lastPeriodStart,
    int? cycleLength,
    @Default(<Interest>[]) List<Interest> interests,
    required DateTime createdAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  static const int defaultCycleLength = 28;
  static const int minCycleLength = 21;
  static const int maxCycleLength = 45;
}
