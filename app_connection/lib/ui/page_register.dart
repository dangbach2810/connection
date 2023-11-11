import 'package:app_connection/model/profile.dart';
import 'package:app_connection/provider/Registerviewmodel.dart';
import 'package:app_connection/ui/AppConstant.dart';
import 'package:app_connection/ui/custom_control.dart';
import 'package:app_connection/ui/page_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_main.dart';

class PageRegister extends StatelessWidget {
  PageRegister({super.key});
  static const String routename = '/register';
  final _usernameController = TextEditingController ();
  final _emailController = TextEditingController ();
  final _password1Controller = TextEditingController ();
  final _password2Controller = TextEditingController ();
  bool agree = true;
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<RegisterViewModel>(context);
    final size = MediaQuery.of(context).size;
    final profile = Profile();
    if(profile.token != ""){
      Future.delayed(Duration.zero, (){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute
        (builder: (context) => const PageMain(),));
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(child: Center( child:
      SingleChildScrollView(

        child: 
        viewmodel.status == 0 || viewmodel.status == 4 ?
        Column(children:
         [
         const Image(image: AssetImage('assets/images/success.gif'),width: 100,),
         Text("Đăng ký thành công", style: AppConstant.textfancyheader),
         viewmodel.status == 3 ?const Text("Bạn phải xác nhận email để hoàn thành đăng ký")
         :const Text(""),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             GestureDetector(
              onTap: () => Navigator.popAndPushNamed(context, 
              PageLogin.routename)
              ,child: Text("Bấm vào đây",style: AppConstant.textLink,)),
             const Text(" để đăng nhập")
           ],
         )
         ],
         ):
        Stack(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, 
            children:[
            const AppLogo(),
            const SizedBox(height: 10,),Text('Thêm tên đi nào',style:  AppConstant.textfancyheader), 
            Text('mãi bên nhau bạn nhé', style:  AppConstant.textfancyheader
            ),
            const SizedBox(height: 20,),
            CustomTextField(textController: _emailController
            , hintText: 'Email', obscureText: false),
            const SizedBox(height: 10,),
            CustomTextField(textController: _usernameController
            , hintText: 'Username', obscureText: false),
            const SizedBox(height: 10,),
            CustomTextField(textController: _password1Controller
            , hintText: 'Password', obscureText: false),
            const SizedBox(height: 10,),
            CustomTextField(textController: _password2Controller
            , hintText: 'Re-password', obscureText: false),
            const SizedBox(height: 10,
            ),
            Text(viewmodel.errorMessage, style: AppConstant.texterror,),
            const SizedBox(height: 10
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(value: viewmodel.agree, onChanged: (value){
              viewmodel.setAgree(value!); 
            },),
            const Text ("Đồng ý"),
            GestureDetector(
              onTap: (){
                showDialog(context: context, builder: (context)=> AlertDialog(title: Text("Quy định"),
                content: SingleChildScrollView(child: Text(viewmodel.quydinh)),));
              }
              ,child: Text (" quy định", style: AppConstant.textLink,)
              )
            ]
            ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                
                onTap: (){
                  final email = _emailController.text.trim();
                  final username = _usernameController.text.trim();
                  final password1 = _password1Controller.text.trim();
                  final password2 = _password2Controller.text.trim();
                  viewmodel.register(email, username, password1, password2);
                }

                ,child: const CustomButton(textButton: "Đăng ký")),
            ),
            ]),
            viewmodel.status == 1 ?
              CustomSpiner(size: size,):Container(),
          ],
        ),
      ),
      )
      ),
    );
    
  }
}