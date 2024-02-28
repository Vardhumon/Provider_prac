import 'dart:math';

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  int userid = 1;

  ThemeData color = ThemeData.dark();

  changeTheme (){
    color = color==ThemeData.dark()? ThemeData.light():ThemeData.dark();
    notifyListeners();
  }
  changeuser (){
    int user = Random().nextInt(10)+1;
    user = user == user? Random().nextInt(10)+1:user;
    userid = user;
    notifyListeners();
  }

}