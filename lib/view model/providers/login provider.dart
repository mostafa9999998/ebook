import 'package:ebook/data/firebase%20utiles/firebase%20utils.dart';
import 'package:flutter/material.dart';
import '../../view/Ui/e book screen/home screen.dart';
import '../../view/Utils/alert dialogs.dart';

class LoginProvider extends ChangeNotifier{
  void login(GlobalKey<FormState> formkey,BuildContext context,String username, String password) async {
    if (formkey.currentState?.validate()==true){
      showLoading(context);
        // try {
        //   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        //       email: username,
        //       password: password
        //   );
        //   hideLoading(context);
        //   print(credential.user!.email);
        //   Navigator.pushReplacementNamed(context, HomeScreen.HomeScreenname);
        // } on FirebaseAuthException catch (e) {
        //   if (e.code == 'user-not-found') {
        //     print('No user found for that email.');
        //   } else if (e.code == 'wrong-password') {
        //     print('Wrong password provided for that user.');
        //   }
        //   hideLoading(context);
        //   showmsg(context, 'e-mail or password is wrong.');
        // }


      bool valid = await FirebaseUtiles.loginAuth(username, password);
      if (valid) {
        hideLoading(context);
        Navigator.pushReplacementNamed(context, HomeScreen.HomeScreenname);
      }else{
      hideLoading(context);
      showmsg(context, 'e-mail or password is wrong.');
      }
    }
  }
}