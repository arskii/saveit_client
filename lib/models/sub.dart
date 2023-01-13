import 'dart:convert';

class Subcription {
  String? icon;
  String? text;
  String? price;

  Subcription({this.icon, this.text, this.price});

  Subcription.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    text = json['text'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['text'] = this.text;
    data['price'] = this.price;
    return data;
  }
}
