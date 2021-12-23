import 'package:flutter_graphql/core/core.dart';
import 'package:flutter_graphql/futures/product/application/state/product_state.dart';
import 'package:flutter_graphql/futures/product/domain/domain.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/datasource/product_remote_data.dart';
import 'package:flutter_graphql/futures/product/infrastrucure/repository/products_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init()async{
    /**
   
   * Todo: Future-Product
   
   */

   sl.registerFactory(() => ProductState(getProducts: sl()));

  /**
   * ! usecases
   */

  sl.registerLazySingleton(() => GetProducts(productRepository: sl()));


    /**
   * ! repostories
   */

  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(productRemoteData: sl(),netWorkInfo: sl()));


   /**
   * ! datasource
   */
  sl.registerLazySingleton<ProductRemoteData>(() =>ProductRemoteDataImpl(client: sl()) );

    
    /**
   * ? core
   */
 sl.registerLazySingleton<NetWorkInfo>(() => NetWorkInfoImpl(internetConnectionChecker: sl()));



  /**
   
   * * 3rd part
   
   */
  sl.registerLazySingleton(() => GraphQLClient(link: sl(), cache: sl()));
  sl.registerLazySingleton(() => HttpLink("https://demo.saleor.io/graphql/"));
  sl.registerLazySingleton(() => GraphQLCache(store: sl()),);
  sl.registerLazySingleton(() => InMemoryStore());
  sl.registerFactory(() => InternetConnectionChecker());




}