
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/Loginviewmodel.dart';
import 'custom_control.dart';
import 'page_main.dart';


class PageLogin extends StatelessWidget {
  PageLogin({super.key});
  static const String routename = '/login';
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewmodel = Provider.of<LoginViewModel>(context);
    if(viewmodel.status == 3){
      Future.delayed(Duration.zero, (){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute
        (builder: (context) => const PageMain(),));
      });
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(child: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                AppLogo(),
                const SizedBox(height: 30,
                ),
                  const Text("Xin chào", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                  const Text("Chúng tôi rất nhớ bạn", 
                  style: TextStyle(fontSize: 25),
                  
                  ),
                  const SizedBox(height: 30,
                  ),
                  CustomTextField(hintText: "username", 
                  textController: _emailController,
                  obscureText: false,),
                  const SizedBox(height: 20,),
                  CustomTextField(hintText: "password",
                   textController: _passController,
                  obscureText: true,),const SizedBox(height: 30,),
                  viewmodel.status == 2 ? Text(viewmodel.errorMessage, style: TextStyle(color: Colors.red),) :Text(""),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap:(){
                        String username = _emailController.text.trim();
                        String password = _passController.text.trim();
                        viewmodel.login(username, password);
                      },
                      child: const CustomButton(textButton: "Đăng nhập",),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text("Chưa có tài khoản?"), 
                    Text("Đăng ký", 
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple[300])) 
                  ],
                  )

                ],
                 
              ),
              viewmodel.status == 1?
              CustomSpiner(size: size)
              :Container(),
            ],
          ),
        ),
      )),
    
    );
  }
}

