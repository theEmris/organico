import 'package:flutter/material.dart';
import 'package:organico/provider/textProvider.dart';

class constButtonStyles {
  static Container kButtonAdd = Container(
      height: 34,
      width: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF2ECC71),
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: const Center(child: Icon(Icons.add)));



  





  static Container kButtonRemove = Container(
      height: 34,
      width: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF2ECC71),
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: const Center(child: Icon(Icons.remove)));




 static Padding kButtonSignIn (String text) =>  Padding(
          padding:  EdgeInsets.all(15),
          child: Container(
            alignment: Alignment.center,
            height: 60.0,
            width: double.infinity,
            decoration:BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(30)
            ),
            
          ),
          child: Text(text, style:TextStyle(color: Colors.white, fontSize: 20)),
          )
          
          );
        
 }









