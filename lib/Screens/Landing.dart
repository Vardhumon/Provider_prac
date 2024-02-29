import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider_prac/Screens/UserDetailTab.dart';
import 'package:provider_prac/Screens/UserDetails.dart';
import 'package:provider_prac/providers/Userprovider.dart';
import 'package:provider_prac/providers/color_provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List <dynamic> users =[];
  @override
  void initState() {
    
    super.initState();
    fetchusers();
    
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context,value, child) => SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Users",style: TextStyle(fontWeight: FontWeight.w400),)),
        ),
        body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final id = user['id'];
          final username = user['username'];
          final name = user['name'];
          final email = user['email'];
          final phone = user['phone'];
          final company_name = user['company']['name'];
          final website = user['website'];
      
        return id==value.userid?GestureDetector(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> UserTab(id: value.userid, name: name, email: email, phone: phone, companyName: company_name, website: website, username: username,) ));},
          child: Card(
            elevation: 10,
            margin: EdgeInsets.all(8),
            child: Column(children: [
              Text(id.toString()),
              Text(name),
              Text(email),
              Text(phone),
              Text(company_name),
              Text(website),
              
              
            ],),
          ),
        ):Container();
      }),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: () {value.changeuser();}, icon: Icon(Icons.swap_horiz)),
          IconButton(onPressed: () {value.changeTheme();}, icon: value.color == ThemeData.dark()?Icon(Icons.lightbulb, color: Colors.yellow,):Icon(Icons.lightbulb_outline, color: Colors.black,)),

        ],
      ),
      ),
    )

    );
  }

  void fetchusers() async{
    const url = "https://jsonplaceholder.typicode.com/users";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json;
      print("users fetched");
    });
  }

  void twofunc() {
    fetchusers();
    
  }
}