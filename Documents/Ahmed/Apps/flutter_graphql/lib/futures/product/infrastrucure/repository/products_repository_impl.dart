import 'package:dartz/dartz.dart';
import 'package:flutter_graphql/core/core.dart';
import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/datasource/product_remote_data.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteData productRemoteData;
  ProductRepositoryImpl({required this.productRemoteData});

  @override
  Future<Either<Failure,List<Product>>>? getProducts() async{
   List<Product> products  = await productRemoteData.getProduct();
   if(products.isNotEmpty) {
     return  Right(products);
   } else{
    return Left(Failure());
   }
  }

}