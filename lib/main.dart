import 'package:ebook/view/Ui/Login/login%20screen.dart';
import 'package:ebook/view/Ui/Register/register%20screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: LoginScreen.loginname,
      routes: {
        LoginScreen.loginname : (_)=> LoginScreen(),
        RegisterScreen.registername : (_) => RegisterScreen()
      },
      home: LoginScreen(),
    );
  }
}
