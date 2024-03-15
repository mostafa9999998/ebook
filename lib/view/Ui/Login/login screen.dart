import 'package:ebook/view%20model/providers/login%20provider.dart';
import 'package:ebook/view/Wedgets/textfield%20wedget.dart';
import 'package:ebook/view/Utils/alert%20dialogs.dart';
import 'package:ebook/view/Utils/app%20color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Register/register screen.dart';
import '../e book screen/home screen.dart';

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
    LoginProvider provider = LoginProvider();
    return ChangeNotifierProvider(
      create: (context) =>  provider,
      child: Scaffold(
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
                      height: MediaQuery.of(context).size.height * .1,
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
                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'please enter valid e-mail';
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
                       // login();
                         provider.login(formkey, context, emailcontroller.text, passwordcontroller.text);
                      },
                        child: Text('Login In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.blue),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text("                Don't have account  ",style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center),
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
      ),
    );
  }

  // void login() async {
  //   if (formkey.currentState?.validate()==true){
  //     showLoading(context);
  //     try {
  //       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //           email: emailcontroller.text,
  //           password: passwordcontroller.text
  //       );
  //       hideLoading(context);
  //       print(credential.user!.email);
  //       Navigator.pushReplacementNamed(context, HomeScreen.HomeScreenname);
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'user-not-found') {
  //         print('No user found for that email.');
  //       } else if (e.code == 'wrong-password') {
  //         print('Wrong password provided for that user.');
  //       }
  //       hideLoading(context);
  //       showmsg(context, 'e-mail or password is wrong.');
  //     }
  //   }
  // }
}
