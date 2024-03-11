
import 'package:ebook/view/Ui/Login/textfield%20wedget.dart';
import 'package:ebook/view/Utils/app%20color.dart';
import 'package:flutter/material.dart';

import '../Register/register screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static  String loginname = 'LoginScreen ';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  bool obsecure = true ;

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primarycolor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * .3 , ),
        child: Form(
          key: formkey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .07,
                  ),
                  Text('Please sign in with your email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Text(
                    'e-mail address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
                  ),
                  TextFieldWedget(
                      hint: 'Ex@gmail.com',
                      cotroler: emailcontroller,
                      Validfunction: (value) {
                        if (value!.isEmpty || value.trim().isEmpty) {
                          return "phone can't be empty";
                        }
                      }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
                  ),
                  TextFieldWedget(
                    hint: 'your Password',
                    cotroler: passwordcontroller,
                    obsec: obsecure,
                    Validfunction: (value) {
                      if (value!.isEmpty || value.trim().isEmpty) {
                        return "password can't be empty";
                      } else if (value.length < 8) {
                        return 'password shoud be at least 8 Characters';
                      }
                    },
                    suffixIcon: InkWell(
                        onTap: () {
                          if (obsecure == true) {
                            obsecure = false;
                          } else {
                            obsecure = true;
                          }
                          setState(() {});
                        },
                        child: obsecure ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  Container(
                   // width: MediaQuery.sizeOf(context).width*0.3,
                    height:MediaQuery.sizeOf(context).width*0.05 ,
                    child: ElevatedButton(onPressed: (){
                      login();
                     // Navigator.pushReplacementNamed(context, MasterScreen.masterScreenname);
                    },
                      child: Text('Login In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.blue),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Text("     Don't have account  ",style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center),
                      InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, RegisterScreen.registername);
                          },
                          child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20, color: Colors.blue),)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (formkey.currentState?.validate()==true){
      try {}
      catch(e){
      }
    }
  }
}
