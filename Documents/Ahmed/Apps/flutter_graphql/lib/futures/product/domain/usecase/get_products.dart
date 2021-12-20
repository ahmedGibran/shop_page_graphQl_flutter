import 'package:dartz/dartz.dart';
import 'package:flutter_graphql/core/core.dart';
import 'package:flutter_graphql/futures/product/domain/domain.dart';

class GetProducts{
 final ProductRepository? productRepository;
  GetProducts({this.productRepository});

  Future<Either<Failure,List<Product>>> getProduct()async{
   List<Product>? products  = await productRepository!.getProducts();
   if(products!.isNotEmpty) {
     return  Right(products);
   } else{
    return Left(Failure());
   }

  }
}