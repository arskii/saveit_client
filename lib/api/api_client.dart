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
      Response response = await _dio
          .post('http://10.0.2.2:8000/api/auth/login/', data: datauser);
      print(response.data);
      print(response.statusCode);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        return e.response!.data;
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.message);
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
    } on DioError catch (e) {
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
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
