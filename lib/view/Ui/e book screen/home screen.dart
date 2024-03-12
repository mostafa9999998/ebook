import 'package:ebook/view/Ui/e%20book%20screen/book%20Style.dart';
import 'package:ebook/view/Utils/app%20color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
 static String  HomeScreenname = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    final screenwedth =MediaQuery.of(context).size.width;
    final crossAxisCount = (screenwedth/300).floor();
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
                    childAspectRatio: .8,
                ),
                itemBuilder: (context, index) {
                  return BookStyle() ;
                },
              itemCount: 8,
            ),
          )
        ],
      ),
    );
  }
}
