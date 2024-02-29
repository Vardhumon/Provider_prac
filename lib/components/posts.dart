import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserPosts extends StatefulWidget {
  final int id;
  final String username;
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final String website;
  const UserPosts({super.key, required this.id, required this.username, required this.name, required this.email, required this.phone, required this.companyName, required this.website});

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  List <dynamic> posts =[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchposts();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20)
        ),
      
        
        padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(widget.id.toString()),
            Text(widget.name),
            Text(widget.email),
            Text(widget.phone),
            Text(widget.companyName),
            Text(widget.website),
        ],
      ),
      Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black45, width: 2)),
        height: 350,
        child: ListView.builder(
          
          itemCount: posts.length,
          itemBuilder: (context,index) {
          
          final post = posts[index];
          final int userid = post['userId'];
          final title = post['title'];
          
          
          return widget.id==userid? Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(title),
                  ],
                ),
              ),
            ),
          ): Container();
        }),
      )
        ],
      )
          );
  }

  void fetchposts() async{
    const url = "https://jsonplaceholder.typicode.com/posts";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      posts = json;
      print("posts fetched");
    });
  }
}