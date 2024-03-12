import 'package:ebook/view/Ui/Login/login%20screen.dart';
import 'package:ebook/view/Ui/Register/register%20screen.dart';
import 'package:ebook/view/Ui/e%20book%20screen/home%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBOGCTXZaxTlUw5iykxg2Djyi-ZsES3mpY",
        projectId: "ebook-82d79",
        messagingSenderId: "511766617852",
        appId: "1:511766617852:web:380b553761687a322f4179",

    )
  );
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
        RegisterScreen.registername : (_) => RegisterScreen(),
        HomeScreen.HomeScreenname : (_) => HomeScreen()
      },
      home: LoginScreen(),
    );
  }
}
