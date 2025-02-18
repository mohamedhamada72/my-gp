import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({this.onTap,required this.title});
  VoidCallback? onTap;
  String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap ,
        child: Container(
          
                  decoration: BoxDecoration(color: Color(0xff004282),
                  borderRadius: BorderRadius.circular(12)),
                  
                  width: 255,
                  height: 60,
                  child: Center(child: Text(title,
                  
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                    
                    )
                    ),
                ),
      ),
    );
  }
}