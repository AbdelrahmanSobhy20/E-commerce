class SQLProduct {
  late int id;
  late String title;
  late String image;
  late double price;
  late String category;

  SQLProduct({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.category,

  });

  SQLProduct.fromData(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    image = map["image"];
    price = map["price"];
    category = map["category"];
  }
  Map<String,dynamic> toData(){
    Map <String , dynamic> map = {};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['price'] = price;
    map['category'] = category;
    return map;
  }
}
