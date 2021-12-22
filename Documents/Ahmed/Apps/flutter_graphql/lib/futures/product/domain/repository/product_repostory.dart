import 'package:dartz/dartz.dart';
import 'package:flutter_graphql/core/core.dart';

import '../domain.dart';

abstract class ProductRepository{
  Future<Either<Failure,List<Product>>>? getProducts();
}