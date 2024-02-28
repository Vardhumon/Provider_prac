import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_prac/providers/color_provider.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({super.key});

  @override
  State<ChildPage> createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(builder: (context,value, child) => Scaffold(
      backgroundColor: value.color,
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: InkWell(
            child: Text("Change Color from child"),
            onTap: () {
              value.changeColor();
            },
          
          ),
        ),
      ),
    ) );
  }
}