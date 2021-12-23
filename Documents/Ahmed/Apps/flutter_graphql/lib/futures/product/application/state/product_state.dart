import 'package:flutter/foundation.dart';
import 'package:flutter_graphql/futures/product/domain/domain.dart';

class ProductState extends ChangeNotifier{

   late List<Product> _product ;
   late bool _error, _loading;
   final GetProducts getProducts ;
   ProductState({required this.getProducts}){
     _product = [];
     _error = false;
     _loading = false;
     getProductsList();
   }

    List<Product> get product=>_product ;
    bool get error=>_error ;
    bool get loading=>_loading ;

   Future<void> getProductsList()async{

     _loading = true;
     notifyListeners();

    final result = await  getProducts.getProduct();
    result?.fold((l){
      _error = true;
      _loading = false;

    }, (r){
      _product = r;
      _error = false;
      _loading = false;
    });

    notifyListeners();
   }


}