import 'package:flutter/material.dart';
import 'package:responsive_chat_app/const/const.dart';
import 'package:responsive_chat_app/widget/MyCircleAvatar/my_circle_avatar.dart';
import 'package:responsive_chat_app/widget/MyMessageDetailCard/my_message_detail_card.dart';
import 'package:responsive_chat_app/widget/MyTextField/my_textfild.dart';

import '../../../model/user_mudel.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                itemCount:
                    ChatService.chats.length, // Use the chat service data
                itemBuilder: (context, index) {
                  final chat = ChatService.chats[index];
                  return InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => ChatPage(
                      //       reciverUserId: '',
                      //     ), // Pass the chat object here
                      //   ),
                      // );
                    },
                    child: MyMessageDetailCard(
                      title: chat.name,
                      subtitle: chat.lastMessage,
                      time: chat.time,
                      badgeCount: 1, // You can set the badge count as needed
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
