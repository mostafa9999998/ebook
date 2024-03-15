import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtiles {

 static Future<bool> loginAuth(String username, String password)async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }

  static Future<String> registerAuth(String username, String password,String name,String phone)async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email:username,
        password: password,
      );
      await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set({
        'name': name,
        'phone_number': phone,
        'isvalid' :false
      });
      return 'account maked successfly' ;
    } on FirebaseAuthException catch (e) {
      late String x ;
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        x='The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        x='The account already exists for that email.';
      }
      return x ;
    } catch (e) {
      print(e);
      return 'something went wrong';
    }
  }
}