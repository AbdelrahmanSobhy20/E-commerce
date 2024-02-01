import 'dart:convert';

import 'package:e_commerce/model/products.dart';
import 'package:e_commerce/model/productsList.dart';
import 'package:http/http.dart' as http;
class ProductsAPI{
  Future <List<ProductsResponse>> getAllProducts()async{
    final http.Response response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode<=299 && response.statusCode>=200){
      var jsonbody=jsonDecode(response.body);
      ProcustsList procustsList = ProcustsList.fromJson(jsonbody);
      List<ProductsResponse> productsResponse = procustsList.products.map((e) => ProductsResponse.fromJson(e)).toList();
      return productsResponse;
    }else{
      throw("RequestFailure${response.body}");
    }
  }
}