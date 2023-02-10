import 'package:budgetapp/models/reg_model.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  Future registerUser(Map<String, dynamic>? datauser) async {
    try {
      Response response =
          await _dio.post('https://reqres.in/api/register', data: datauser);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e.message);
      return e.message;
    }
  }

  Future login(Map<String, dynamic>? datauser) async {
    try {
      Response response =
          await _dio.post('https://reqres.in/api/login', data: datauser);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e.message);
      return e.message;
    }
  }
}
