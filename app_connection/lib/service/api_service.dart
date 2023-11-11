import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService{
 static final ApiService _instance = ApiService._internal();
  ApiService._internal();
  factory ApiService(){
    return _instance;
  }

  final url_login = "https://chocaycanh.club/public/api/login";
  late Dio _dio;
  final url_register = "https://chocaycanh.club/public/api/register";
  void initialize(){
    _dio = Dio(BaseOptions(responseType: ResponseType.json));
  }
  Future<Response?> loginUser(String username, String password) async{
    Map<dynamic, dynamic> param = {"username": username, "password": password, "device_name": "android"};
    Map<String, String> headers = {
      'Content-Type':"application/json; charset=UTF-8",
    };
    try{

    final response = await _dio.post(url_login, 
    data: jsonEncode(param), 
    options: Options(headers: headers));
    if(response.statusCode == 200){
        return response;
    }
    }catch(e){
      print(e);
    }
    return null;
  }

  Future<Response?> registerUser(String email, String username, String password)async
  {
    Map<dynamic, dynamic> param = {
      "username": username, 
      "email": email,
      "password": password,  
      "password_confirmation": password,
      "tos" : "true"
      };
    Map<String, String> headers = {
      'Content-Type':"application/json; charset=UTF-8",
    };
    try{

    final response = await _dio.post(url_register, 
    data: jsonEncode(param), 
    options: Options(headers: headers));
    if(response.statusCode == 201){
        print(response.data);
        return response;
    }
    }catch(e){
      if(e is DioException){
        print(e.response); 
      }
    }
    return null;
  }
}