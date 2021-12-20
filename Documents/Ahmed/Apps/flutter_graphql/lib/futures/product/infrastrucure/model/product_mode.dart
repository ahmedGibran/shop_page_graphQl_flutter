import 'package:flutter_graphql/futures/product/domain/entities/product.dart';

class ProductModel extends Product{
  ProductModel({required String imageUrl,required String title}):super(imageUrl: imageUrl,title: title);

  factory ProductModel.fromJson(Map<String,dynamic> dataJson){
    return ProductModel(
      title: dataJson["name"],
      imageUrl: dataJson["media"][0]["url"]
    );
  }

  Map<String,dynamic> toJson(){
    return{
      "name":title,
      "url":imageUrl
    };
  }

}