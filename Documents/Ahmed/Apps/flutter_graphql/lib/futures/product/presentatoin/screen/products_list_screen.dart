import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphql/futures/product/application/state/product_state.dart';
import 'package:provider/provider.dart';
class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Consumer<ProductState>(
          builder: (context,state,child){
            if(state.loading){
              return  const SizedBox(
                height: 100,
                width: 100,
                child: Center(child: CircularProgressIndicator(),),
              );
            }
            else if(state.error){
              return  const SizedBox(
                height: 100,
                width: 100,
                child: Placeholder(),
              );
            }else{
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.product.length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(state.product[index].imageUrl!),
                          ),
                          const SizedBox(height: 10,),
                          Text("${state.product[index].title}")
                        ],
                      );
                    }),
              );
            }
          },
        ),
      ),
    );
  }
}
