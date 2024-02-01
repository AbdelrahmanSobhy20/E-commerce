import 'dart:convert';

class ProcustsList{
  late final List<dynamic> products;
  ProcustsList({required this.products});
  factory ProcustsList.fromJson (List json){
    return ProcustsList(products: json);
  }
}