import 'package:dartz/dartz.dart';
import 'package:flutter_graphql/core/core.dart';
import 'package:flutter_graphql/core/exception.dart';
import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/datasource/product_remote_data.dart';

class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteData productRemoteData;
    final NetWorkInfo netWorkInfo;

  ProductRepositoryImpl({required this.productRemoteData,required this.netWorkInfo});

  @override
  Future<Either<Failure,List<Product>>> getProducts() async{
    final isConnected = await netWorkInfo.isConnected;
    if(isConnected){
    try{
      List<Product> products  = await productRemoteData.getProduct();
        return  Right(products);
      }on ServerException{
      return Left(ServerFailure());
    }
   } else{
    return Left(ServerFailure());
    }
  
  }

}