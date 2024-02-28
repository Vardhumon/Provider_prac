import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/Screens/Landing.dart';
import 'package:provider_prac/providers/Userprovider.dart';
import 'package:provider_prac/providers/color_provider.dart';

void main (){
  runApp(ChangeNotifierProvider(create: (context) => UserProvider()
  ,child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder:(context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: value.color,
      home: LandingPage(),
      ),);
  }
}