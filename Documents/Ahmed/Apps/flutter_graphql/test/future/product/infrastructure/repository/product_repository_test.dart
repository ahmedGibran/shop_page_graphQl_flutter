import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_graphql/core/errors/failure.dart';
import 'package:flutter_graphql/core/network/network_info.dart';
import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/datasource/product_remote_data.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/model/product_mode.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/repository/products_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';
import 'product_repository_test.mocks.dart';
@GenerateMocks([ProductRemoteData,NetWorkInfo])
void main(){
  late ProductRepositoryImpl productRepositoryImpl;
  late MockProductRemoteData  mockProductRemoteData;
  late MockNetWorkInfo mockNetWorkInfo;
  setUp((){
    mockProductRemoteData = MockProductRemoteData();
    mockNetWorkInfo  = MockNetWorkInfo();
productRepositoryImpl = ProductRepositoryImpl(productRemoteData:mockProductRemoteData,netWorkInfo: mockNetWorkInfo );
  });
group("product repostiry", (){

  test('Should return products data when call remote data', () async{
    final dataFixture = json.decode(fixture("products.json"));
    List<Product> products = [];
    for(var item in dataFixture["data"]['products']['edges']){
    products.add(ProductModel.fromJson(item['node']));
    }
   when(mockNetWorkInfo.isConnected).thenAnswer((realInvocation) async=> true);
   when(mockProductRemoteData.getProduct()).thenAnswer((realInvocation) async=> products);
   await productRepositoryImpl.getProducts();
  });


  // test('Should be throw Failuer data when there are no neternet connectection', () async{
  
  //  when(mockNetWorkInfo.isConnected).thenAnswer((_) async=> true);
  //     when(productRepositoryImpl.getProducts()).thenAnswer((_) async=> Left(Failure()));

  //   final result = await  productRepositoryImpl.getProducts();
  //   expect(result,Left(Failure()));
  // });
});
  
}