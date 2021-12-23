import 'dart:convert';

import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/model/product_mode.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixture/fixture_reader.dart';
void main(){
    
    late List<Product> products ;

    setUp((){
products =[];
    });

    test('Should data fromate work fine', () {
      final fixtureData = json.decode(fixture("products.json"));
      for(var item in fixtureData['data']['products']['edges']){
       products.add(ProductModel.fromJson(item['node']));
      }
      expect(products.isNotEmpty, true);

    });



    
}