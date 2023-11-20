import 'package:flutter/material.dart';

var myDefaultBAckground = const Color(0xFFF0F0F0);
var myCenterBAckground = const Color.fromARGB(197, 255, 253, 253);
var textColor = Colors.white;

var myAppBar = AppBar(
  title: const Padding(
    padding: EdgeInsets.only(left: 10),
    child: Text(
      "Chat App",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  backgroundColor: Colors.grey[900],
);


// var height =MediaQuery.of(context).size.height;