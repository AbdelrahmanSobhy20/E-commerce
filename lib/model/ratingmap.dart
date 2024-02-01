class Rating {
  late double rate;
  late int count;

  Rating({required this.rate, required this.count});

  Rating.fromJson(Map<String, dynamic> json) {
   rate = double.parse(json['rate'].toString());
   count = int.parse(json['count'].toString());
  }

  Map<String, dynamic> toJson() {
    return {
      "rate": rate,
      "count": count,
    };
  }
}
