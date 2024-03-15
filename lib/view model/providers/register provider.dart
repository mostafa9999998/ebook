import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/firebase utiles/firebase utils.dart';
import '../../view/Utils/alert dialogs.dart';

class RegisterProvider extends ChangeNotifier{

  void register(GlobalKey<FormState> formkey,BuildContext context,String username, String password,String name,String phone) async {



    if (formkey.currentState?.validate()==true){

      showLoading(context);
          // try {
          //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          //     email:username ,
          //     password: password,
          //   );
          //   hideLoading(context);
          //   showsucsses(context, 'account maked successfly');
          //   await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
          //     'name': name,
          //     'phone_number': phone,
          //   });
          // } on FirebaseAuthException catch (e) {
          //   if (e.code == 'weak-password') {
          //     print('The password provided is too weak.');
          //     hideLoading(context);
          //     showmsg(context, 'The password provided is too weak.');
          //   } else if (e.code == 'email-already-in-use') {
          //     print('The account already exists for that email.');
          //     hideLoading(context);
          //     showmsg(context, 'The account already exists for that email.');
          //   }
          // } catch (e) {
          //   print(e);
          // }

     String respons = await FirebaseUtiles.registerAuth(username, password, name, phone);
      if (respons == 'account maked successfly') {
        hideLoading(context);
        showsucsses(context, respons);
      }else {
        hideLoading(context);
        showmsg(context, respons);
      }
    }
  }
}