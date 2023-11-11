

import 'package:app_connection/repository/login_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier{
  String errorMessage = "";
  int status = 0; //0 not login, 1 - wait, 2 error, 3 alreedy login
  LoginRepository loginRepository = LoginRepository();
  Future<void> login(String username, String password) async{
    status = 1;
    notifyListeners();
    try{
        var profile = await loginRepository.login(username, password);
        if(profile.token == ""){
          status = 2;
          errorMessage = "Tài khoản hoặc mật khẩu sai!";
        }
        else{
          status = 3;
        }
        notifyListeners();
    }catch(e){
      print(e.toString());
    }
  }
}