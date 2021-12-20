import 'package:flutter/material.dart';
import 'package:flutter_graphql/futures/product/application/state/product_state.dart';
import 'package:flutter_graphql/futures/product/presentatoin/screen/products_list_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
void main() {



  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>ProductState())
    ],
    child: MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  ProductsListScreen(),
    ),
    );
  }
}

