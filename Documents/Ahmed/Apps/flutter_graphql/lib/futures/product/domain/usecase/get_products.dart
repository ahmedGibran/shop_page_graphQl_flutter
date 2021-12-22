import 'package:dartz/dartz.dart';
import 'package:flutter_graphql/core/core.dart';
import 'package:flutter_graphql/futures/product/domain/domain.dart';

class GetProducts{
 final ProductRepository productRepository;
  GetProducts({required this.productRepository});

  Future<Either<Failure,List<Product>>?> getProduct()async{
  return productRepository.getProducts();

  }
}