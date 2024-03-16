import 'package:ebook/data/firebase%20utiles/firebase%20utils.dart';
import 'package:ebook/view/Ui/e%20book%20screen/book%20Style.dart';
import 'package:ebook/view/Utils/app%20color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 static String  HomeScreenname = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    final screenwedth =MediaQuery.of(context).size.width;
    final crossAxisCount = (screenwedth/300).floor();
    final user = FirebaseAuth.instance.currentUser;
    if(user != null){
     String uid= user.uid;
    return FutureBuilder(future: FirebaseUtiles.getactiveFromFirestore(uid),
    builder: (context, snapshot) {
      if(snapshot.hasData){
        if(snapshot.data==true){
          return FutureBuilder(
            future: FirebaseUtiles.getbooklist(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Scaffold(
                  backgroundColor: ColorApp.primarycolor,
                  body: Column(
                    children: [
                      Text('e-book List',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                      ),),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*.05,
                      ),
                      Container(
                        height:MediaQuery.of(context).size.height*.9 ,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: .78,
                          ),
                          itemBuilder: (context, index) {
                            return BookStyle(book: snapshot.data![index],) ;
                          },
                          itemCount: snapshot.data!.length,
                        ),
                      )
                    ],
                  ),
                );
              }
              else if (snapshot.hasError){
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }else{
          return Scaffold(body: Center(child: Text('your mail not activate yet',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)));
        }
      }
      else if(snapshot.hasError){
        return Center(
          child: Text(snapshot.error.toString()),
        );
      }
      else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
    );
    }
    else{
    return Center(
      child: Text('not found user'),
    ) ;
    }
  }
}

