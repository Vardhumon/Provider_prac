import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_prac/components/albums.dart';
import 'package:provider_prac/components/posts.dart';

class UserTab extends StatefulWidget {
   final int id;
  final String username;
  final String name;
  final String email;
  final String phone;
  final String companyName;
  final String website;
  const UserTab({super.key, required this.id, required this.username, required this.name, required this.email, required this.phone, required this.companyName, required this.website});

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
      ),
      body: Column(
        children: [
          TabBar(tabs: [
            Tab(
              icon: Icon(Icons.post_add),
            ),
            Tab(
              icon: Icon(Icons.album),
            )
          ],
          ),
          Expanded(
          
            child: TabBarView(children: [
            UserPosts(id: widget.id, username: widget.username, name: widget.name, email: widget.email, phone: widget.phone, companyName: widget.companyName, website: widget.website),
            UserAlbum(id: widget.id, username: widget.username, name: widget.name, email: widget.email, phone: widget.phone, companyName: widget.companyName, website: widget.website),
          ]),
          )
        ],
      ),
      
    ));
  }

 
}