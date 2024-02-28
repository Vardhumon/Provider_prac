import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/childpage.dart';
import 'package:provider_prac/providers/color_provider.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(builder: (context,value, child) => Scaffold(
        backgroundColor: context.watch<ColorProvider>().color,
        body: Container(
          height: 200,
          child: Column(
            children: [
              Container(
                color: Colors.blueAccent,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    value.changeColor();
                  },
                  child: Text("data"),
                )
              ),
              Container(
                color: Colors.blueAccent,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => ChildPage(),));
                  },
                  child: Text("Go to child widget")),
              )
            ],
          ),
        ),
      ));
  }
}