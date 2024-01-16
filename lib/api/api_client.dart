import 'dart:developer';

import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  Future registerUser(Map<String, dynamic>? datauser) async {
    try {
      Response response =
          await _dio.post('https://reqres.in/api/register', data: datauser);
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      log(e.message.toString());
      return e.message;
    }
  }

  Future login(Map<String, dynamic>? datauser) async {
    try {
      Response response = await _dio
          .post('http://10.0.2.2:8000/api/auth/login/', data: datauser);
      print(response.data);
      print(response.statusCode);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        log(e.response!.data.toString());
        return e.response!.data;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        log(e.message.toString());
      }
    }
  }

  Future<Response> getUserProfileData() async {
    try {
      Response response = await _dio.get(
        'https://reqres.in/api/login',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${0}',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }

  Future<Response> logout() async {
    try {
      Response response = await _dio.get(
        'https://reqres.in/api/login',
        options: Options(
          headers: {'Authorization': 'Bearer ${0}'},
        ),
      );
      return response.data;
    } on DioException catch (e) {
      return e.response!.data;
    }
  }
}
