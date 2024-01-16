import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../models/sub.dart';

Future<List<Subcription>> getSub() async {
  var response = await rootBundle.loadString("assets/index.json");
  List mapData = await jsonDecode(response);

  print(mapData);

  List<Subcription> sub = mapData.map((e) => Subcription.fromJson(e)).toList();

  return sub;
}
