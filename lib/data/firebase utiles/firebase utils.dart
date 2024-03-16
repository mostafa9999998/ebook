import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../modules/Book.dart';

class FirebaseUtiles {

  static CollectionReference<Book> collection() {
    return FirebaseFirestore.instance
        .collection(Book.booksname)
        .withConverter<Book>(
        fromFirestore: (snapshot, option) =>
            Book.fromjeson(snapshot.data()!),
        toFirestore: (book, option) => book.tojeson());
  }

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
        'active' :false,
        'id' : credential.user!.uid
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

 static Future<List<Book>> getbooklist() async {
   QuerySnapshot<Book> collec = await collection().get();
   List<Book> x = collec.docs.map((doc) {
     return doc.data();
   }).toList();
   return x;
 }

  static  Future<bool> getactiveFromFirestore(String uid) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final docRef = firestore.collection('users').doc(uid);

    try {
      final docSnapshot = await docRef.get();
      bool x ;
      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        x= data!['active'];
      } else {
        print('No document found with the provided ID');
        x= false ;
      }
      return x ;
    } catch (error) {
      print('Error getting document: $error');
      return false ;
    }
  }
}
