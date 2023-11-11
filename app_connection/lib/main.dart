
import 'package:app_connection/model/profile.dart';
import 'package:app_connection/provider/Registerviewmodel.dart';
import 'package:app_connection/service/api_service.dart';
import 'package:app_connection/ui/page_login.dart';
import 'package:app_connection/ui/page_main.dart';
import 'package:app_connection/ui/page_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/Loginviewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService api = ApiService();
  api.initialize();
  Profile profile = Profile();
  profile.initialize();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<LoginViewModel>(create: (context) => LoginViewModel(),
      ),
      ChangeNotifierProvider<RegisterViewModel>(create: (context) => RegisterViewModel(),
      )
    ],child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => PageMain(),
        '/login':(context) => PageLogin(),
        '/register':(context) => PageRegister(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageRegister(),
    );
  }
}
