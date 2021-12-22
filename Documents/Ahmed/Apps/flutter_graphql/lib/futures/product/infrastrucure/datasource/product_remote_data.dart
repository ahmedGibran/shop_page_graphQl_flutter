import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/datasource/queries.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/model/product_mode.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductRemoteData{

  Future<List<Product>> getProduct()async{
    List<Product> products = [];
    final HttpLink httpLink = HttpLink(
      'https://demo.saleor.io/graphql/',
    );

    GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(
          store: InMemoryStore()),
      link: httpLink,
    );

    QueryResult queryResult = await client.query(
      QueryOptions(document: Queries().queryProduct)
    );

    if(queryResult.hasException){
      //exception
    } else if(queryResult.data!=null){

      for(var item in queryResult.data!['products']["edges"]) {
        products.add(ProductModel.fromJson(item["node"]));
      }

    }
    return products;

  }

}