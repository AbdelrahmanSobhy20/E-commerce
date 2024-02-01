import 'package:flutter/material.dart';
import '../model/products.dart';

class Purchasses extends ChangeNotifier{
  int _num=1;
  Map<ProductsResponse,int> myPurchasses={};

  get num=>_num;

  void increment(){

    _num++;
    notifyListeners();
  }

  void decrement(){
    if(_num>1) {
      _num--;
      notifyListeners();
    }
  }

  void returnTo1(){
    _num = 1;
    notifyListeners();
  }

  void buy(ProductsResponse iteam){
    myPurchasses[iteam]=_num;
    returnTo1();
    notifyListeners();
  }

}