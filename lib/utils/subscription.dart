import 'dart:convert';
import '../../../models/sub.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<Subcription> Sub() async {
  var response = await rootBundle.loadString("assets/index.json");
  var data = await json.decode(response);

  return data;

  print(data.toString());
}
