import 'dart:convert';

import 'package:budgetapp/models/saving.model.dart';
import 'package:flutter/services.dart';

class SavingsApi {
  Future<List<Saving>> readJson() async {
    final String response = await rootBundle.loadString("assets/saving.json");
    List dataMap = await jsonDecode(response);
    List<Saving> data = dataMap.map((e) => Saving.fromJson(e)).toList();
    return data;
  }
}
