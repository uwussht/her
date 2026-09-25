import '../../../core/services/mock_asset_loader.dart';
import '../domain/product.dart';
import '../domain/product_repository.dart';
import '../domain/seller.dart';

class MockProductRepository implements ProductRepository {
  const MockProductRepository(this._loader);

  final MockAssetLoader _loader;

  @override
  Future<List<Product>> fetchProducts() async => [
    for (final json in await _loader.loadList('products'))
      Product.fromJson(json),
  ];

  @override
  Future<List<Seller>> fetchSellers() async => [
    for (final json in await _loader.loadList('sellers')) Seller.fromJson(json),
  ];
}
