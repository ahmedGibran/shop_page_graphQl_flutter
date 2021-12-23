import 'dart:convert';

import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/datasource/product_remote_data.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/model/product_mode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixture/fixture_reader.dart';
import 'product_remote_data_test.mocks.dart';

@GenerateMocks([GraphQLClient])
void main(){
late ProductRemoteDataImpl productRemoteDataImpl;
late MockGraphQLClient mockGraphQLClient;
setUp((){
mockGraphQLClient = MockGraphQLClient();
productRemoteDataImpl = ProductRemoteDataImpl(client:mockGraphQLClient );
});

group("remote data", (){
  final dataFixture = json.decode(fixture("products.json"));
    List<Product> products = [];
    for(var item in dataFixture["data"]['products']['edges']){
    products.add(ProductModel.fromJson(item['node']));
    }
test('should call query and return data when  the http reqeust is successfully', () async{

    when(mockGraphQLClient.query(any)).thenAnswer((_) async=> QueryResult(data:dataFixture['data'],source: null));
      await productRemoteDataImpl.getProduct();
      verify(mockGraphQLClient.query(any));
});
});
}