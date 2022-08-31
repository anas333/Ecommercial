// ignore_for_file: sort_constructors_first

class Shirts {
  final dynamic id;
  final String shirtName;
  final int shirtPrice;
  final String shirtDesc;
  final String shirtImg;

  Shirts(
      {required this.id,
      required this.shirtName,
      required this.shirtPrice,
      required this.shirtDesc,
      required this.shirtImg});

  factory Shirts.fromJson(Map<dynamic, dynamic> json) {
    return Shirts(
        id: json['id'] as dynamic,
        shirtPrice: json['price'] as int,
        shirtName: json['name'] as String,
        shirtDesc: json['desc'] as String,
        shirtImg: json['img'] as String);
  }
}
