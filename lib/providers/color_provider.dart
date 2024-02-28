import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier{
  
  Color color = Colors.black;

  changeColor (){
    color = color==Colors.white? Colors.black:Colors.white;
    notifyListeners();
  }

}