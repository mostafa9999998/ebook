import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWedget extends StatelessWidget {
  TextFieldWedget(
      {super.key,
      required this.hint,
      required this.cotroler,
      this.obsec = false,
      required this.Validfunction,
      this.suffixIcon});
  String hint;
  bool obsec;
  TextEditingController cotroler;
  String? Function(String?) Validfunction;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
       // cursorColor: Colors.white,
        decoration: InputDecoration(
          fillColor: Colors.white,
         filled: true,
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: suffixIcon,
        ),
        controller: cotroler,
        obscureText: obsec,
        validator: Validfunction,
      ),
    );
  }
}
