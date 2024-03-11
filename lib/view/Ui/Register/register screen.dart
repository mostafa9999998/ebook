import 'package:ebook/view/Utils/app%20color.dart';
import 'package:flutter/material.dart';

import '../Login/login screen.dart';
import '../Login/textfield wedget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
static  String registername = 'RegisterScreen ';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController anotherphonecontroller = TextEditingController();

  TextEditingController namecontroller = TextEditingController();


  TextEditingController addresscontroller = TextEditingController();

  bool obsecure = true ;

  GlobalKey<FormState> formkey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.primarycolor,
      body: Container(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * .3 , ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .06,
                    ),
                    Text('Register Screen', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Text(
                      'name',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
                    ),
                    TextFieldWedget(
                        hint: 'Name',
                        cotroler: namecontroller,
                        Validfunction: (value) {
                          if (value!.isEmpty || value.trim().isEmpty) {
                            return "name can't be empty";
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Text(
                      'Email address',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
                    ),
                    TextFieldWedget(
                        hint: 'You@Example.com',
                        cotroler: emailcontroller,
                        Validfunction: (value) {
                          if (value!.isEmpty || value.trim().isEmpty) {
                            return "e-mail can't be empty";
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
                      'Your Address',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
                    ),
                    TextFieldWedget(
                        hint: 'Ex: nasr city in cairo',
                        cotroler: addresscontroller,
                        Validfunction: (value) {
                          if (value!.isEmpty || value.trim().isEmpty) {
                            return "address can't be empty";
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Text(
                      'phone',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22,color: Colors.white),
                    ),
                    TextFieldWedget(
                        hint: 'phone num',
                        cotroler: phonecontroller,
                        Validfunction: (value) {
                          if (value!.isEmpty || value.trim().isEmpty) {
                            return "phone can't be empty";
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    TextFieldWedget(
                        hint: 'another phone num',
                        cotroler: anotherphonecontroller,
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
                      height: MediaQuery.of(context).size.height * .07,
                    ),
                    Container(
                      //width: MediaQuery.sizeOf(context).width*0.9,
                      height:MediaQuery.sizeOf(context).width*0.05 ,
                      child: ElevatedButton(onPressed: (){
                        register();
                        //  Navigator.pushReplacementNamed(context, Selectscreen.selectname);
                      },
                        child: Text('Sign In',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26,color: Colors.blue),),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Text("already have an account  ",style: TextStyle(fontSize: 20,color: Colors.white),textAlign:TextAlign.center),
                        InkWell(
                            onTap: (){
                               Navigator.pushReplacementNamed(context, LoginScreen.loginname);
                            },
                            child: Text('Sign in',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.blue),)),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                  ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formkey.currentState?.validate()==true){
      try{
      }
      catch(e){
      }
    }
  }
}
