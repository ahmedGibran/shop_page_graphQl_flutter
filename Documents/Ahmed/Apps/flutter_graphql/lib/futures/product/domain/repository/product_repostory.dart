import '../domain.dart';

abstract class ProductRepository{
  Future<List<Product>>? getProducts();
}