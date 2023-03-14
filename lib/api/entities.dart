import 'dart:convert';

import 'package:budgetapp/models/entities.model.dart';
import 'package:flutter/services.dart';

class EntitiesApi {
  Future<List<Entities>> readJson() async {
    final String response = await rootBundle.loadString("assets/entities.json");
    List data = await jsonDecode(response);
    List<Entities> entities = data.map((e) => Entities.fromJson(e)).toList();
    return entities;
  }
}
