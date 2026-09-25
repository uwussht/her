import 'product.dart';
import 'seller.dart';

abstract interface class ProductRepository {
  Future<List<Product>> fetchProducts();

  Future<List<Seller>> fetchSellers();
}
