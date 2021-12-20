import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/datasource/product_remote_data.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteData productRemoteData;
  ProductRepositoryImpl({required this.productRemoteData});

  @override
  Future<List<Product>>? getProducts() async{
    List<Product> products  = await productRemoteData.getProduct();
    return products;
  }

}