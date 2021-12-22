import 'package:flutter/material.dart';
import 'package:flutter_graphql/core/dependencies_injection.dart';
import 'package:flutter_graphql/futures/product/application/state/product_state.dart';
import 'package:flutter_graphql/futures/product/presentatoin/screen/products_list_screen.dart';
import 'package:provider/provider.dart';
void main(){
   init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
    ChangeNotifierProvider(
    create: (context) => sl<ProductState>(),),
    ],
    child: MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const ProductsListScreen(),
    ),
    );
  }
}

