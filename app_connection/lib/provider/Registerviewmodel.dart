import 'package:app_connection/repository/register_repository.dart';
import'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier{
  int status = 0; //0.chưa đăng ký
                  //1.đang đăng ký
                  //2.Đăng ký lỗi
                  //3.đăng ký xác nhận
                  //4.Đăng k xm
  String errorMessage = "";
  bool agree = false;
  final registerRepo = RegisterRepository();
  String quydinh = "Khi tham gia vào ứng dụng các bạn đồng ý các điều khoản sau:\n"
  +"1.Các thông tin của bạn sẽ được chia sẽ với các thành học\n"
  +"2.Các thông tin của bạn có thể ảnh hưởng học tập ở trường\n"
  +"3.Các thông tin của bạn sẽ được xóa vĩnh viễn kho có yêu cầu xóa thông tin\n";
  void setAgree(bool value){
    agree = value;
    notifyListeners();
  }
  Future<void> register(String email, String username, String password1, String password2)
  async{
      status = 1;
      notifyListeners();
      if(agree == false){
        status = 2;
        errorMessage += "Bạn phải đồng ý điều khoản trước khi đăng ký\n";

      }
      if(email.isEmpty || username
      .isEmpty || password1.isEmpty){
        status = 2;
        errorMessage += "Email, unsername, password không được để trống\n";
      }
      final emailValiid = RegExp("[a-z0-9]+@gmail.com").hasMatch(email);
      if(emailValiid == false){
          errorMessage += "email không hợp lệ!\n";
      }
      if(password1.length <8){
        status = 2;
        errorMessage = "Password cần lớn hơn 8 chữ";
      }
      if(password1 != password2){ 
       status = 2;
       errorMessage = "mật khẩu không giống nhau";
      }
      if(status != 2){
        status = await registerRepo.register(email, username, password1);
      }
      notifyListeners();
  }
}