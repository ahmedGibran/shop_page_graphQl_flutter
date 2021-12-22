import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/model/product_mode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixture/fixture_reader.dart';
import 'get_products_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main(){
late GetProducts getProducts;
late MockProductRepository mockProductRepository;

setUp((){
  mockProductRepository = MockProductRepository();
 getProducts = GetProducts(productRepository:mockProductRepository);
});


test("Should fromate data be successfully when call get products method",()async{
List<Product> products =  [];
final fixtureData = json.decode(fixture("products.json"));
for(var item in fixtureData['data']['products']["edges"]){
  // print(item['node']);
products.add(ProductModel.fromJson(item['node']));
}
when(mockProductRepository.getProducts()).thenAnswer((_) async => Right(products));
final result = await getProducts.getProduct();
verify(mockProductRepository.getProducts());
expect(result, equals(Right(products)));

});
}

