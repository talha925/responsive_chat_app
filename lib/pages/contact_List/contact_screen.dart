import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_chat_app/const/app_colors.dart';
import 'package:responsive_chat_app/const/const.dart';
import 'package:responsive_chat_app/const/dark_radial_background.dart';
import 'package:responsive_chat_app/pages/chat_page.dart';
import 'package:responsive_chat_app/widget/MyMessageDetailCard/my_message_detail_card.dart';
import 'package:responsive_chat_app/widget/MyTextField/my_textfild.dart';

class MyContactScreen extends StatelessWidget {
  MyContactScreen({Key? key}) : super(key: key);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DarkRadialBackground(
            // Add the DarkRadialBackground here
            color: HexColor.fromHex("#181a1f"),
            position: "topLeft",
          ),
          Column(
            children: [
              const SizedBox(height: 30.0),
              Row(
                children: [
                  const SizedBox(width: 16.0),
                  InkWell(
                    onTap: FirebaseAuth.instance.signOut,
                    child: Text(
                      'Chats',
                      style: GoogleFonts.lato(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),

              //serch Textfiled
              const MyTextField(),
              const SizedBox(height: 8.0),
              Divider(color: textColor),
              const SizedBox(height: 8.0),
              Expanded(child: _buildUserList()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          // print("Builder called!"); // Add this print statement

          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("loading .... ");
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    if (document.exists) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      if (_auth.currentUser!.email != data['email']) {
        // if (kDebugMode) {
        //   print("Email: ${data["email"]}");
        // } // Print the email to debug

        String fullName = "${data["firstName"]} ${data["lastName"]}";

        return InkWell(
          onTap: () {
            Get.to(ChatPage(
              reciverUserID: data['uid'],
              reciverUserEmail: data['email'],
              // reciverUserId: data['uid'],
            ));
            // Navigate to the chat page or perform other actions
          },
          child: MyMessageDetailCard(
            title: fullName,
            subtitle: '', // Provide appropriate subtitle value
            time: '', // Provide appropriate time value
            badgeCount: 1,
          ),
        );
      }
    }
    return Container(); // Return a default widget or an empty container if needed
  }
}
