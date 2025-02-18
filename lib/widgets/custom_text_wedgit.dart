import 'package:flutter/material.dart';

class CustomFormTextfield extends StatelessWidget {
   CustomFormTextfield({this.hintText,this.onChanged}) ;
  Function (String)?onChanged;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
         if (data!.isEmpty){
        return 'field is required';
      }
       },
      onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black
                )
              )
            ),
          );
  }
}