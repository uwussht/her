import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

/// A shop seller. The commission rate is backend-only and never shown.
@freezed
abstract class Seller with _$Seller {
  const factory Seller({
    required String id,
    required String name,

    /// Kazakhstan brand: surfaced with a "local brand" badge.
    @Default(false) bool isLocalBrand,
    @Default(0) double rating,
    String? city,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
