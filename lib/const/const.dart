import 'package:flutter/material.dart';
import 'package:responsive_chat_app/utils/my_message_card.dart';

import '../utils/my_circle_avatar.dart';
import '../utils/my_textfild.dart';

var myDefaultBAckground = Color(0xFFF0F0F0);
var myCenterBAckground = Color.fromARGB(197, 255, 253, 253);

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

var myDrawer = Expanded(
  child: Drawer(
    backgroundColor: myDefaultBAckground,
    child: Column(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Row(
                children: [
                  MycircleAuvatar(
                    radius: 25,
                  ),

                  const SizedBox(width: 16.0), // Add some spacing

                  const Column(
                    children: [
                      Text(
                        'John Doe', // Your user's name

                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Software Engineer', // Your subtitle or sub-name

                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 16.0), // Add some spacing

                  IconButton(
                    icon: const Icon(Icons.edit), // Edit icon

                    onPressed: () {
                      // Add functionality to edit the profile here
                    },
                  ),
                ],
              ),
              const MyTextField(),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const MyMessageCard();
              }),
        ),
      ],
    ),
  ),
);
