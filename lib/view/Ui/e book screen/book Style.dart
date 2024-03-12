import 'package:flutter/material.dart';

class BookStyle extends StatelessWidget {
  const BookStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*.007 ,vertical: MediaQuery.of(context).size.height*.02),
      decoration: BoxDecoration(
        border: Border.all(width: 3,color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.246,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Screenshot .png'),
                    fit: BoxFit.fill
                )
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*.04,),
          Text('Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: MediaQuery.of(context).size.height*.025,),
          Text('category',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(height: MediaQuery.of(context).size.height*.025,),
          Row(
            children: [
              Spacer(),
              Text('Author',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ],
          )
        ],
      ),
    );
  }
}
