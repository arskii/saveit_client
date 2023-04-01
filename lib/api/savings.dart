import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:budgetapp/models/saving.model.dart';
import 'package:flutter/services.dart';

class SavingsApi {
  Future<List<Saving>> readJson() async {
    final dio = Dio();
    try {
      final response =
          await dio.get('https://64281f2c161067a83b0762b8.mockapi.io/entities');
      if (response.statusCode == 200) {
        List<dynamic> dataMap = response.data;
        List<Saving> data =
            dataMap.map((data) => Saving.fromJson(data)).toList();
        return data;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }
}
