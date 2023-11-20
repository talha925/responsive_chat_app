import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_chat_app/const/app_colors.dart';
import 'package:responsive_chat_app/const/const.dart';
import 'package:responsive_chat_app/model/message.dart';
import 'package:responsive_chat_app/services/chat/chat_service.dart';
import 'package:responsive_chat_app/widget/ChatBubble/chat_bubble.dart';
import 'package:responsive_chat_app/widget/MyAppbar/appbar.dart';
import 'package:responsive_chat_app/widget/MyChatTextField/my_chat_textfild.dart';

class ChatPage extends StatefulWidget {
  final String reciverUserEmail;
  final String reciverUserID;

  const ChatPage({
    Key? key,
    required this.reciverUserEmail,
    required this.reciverUserID,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> chatMessages = [];
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;
  final ChatService _chatService = ChatService();
  TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void sendMessage() async {
    if (messageController.text.isNotEmpty) {
      //only send message if there is something to send
      await _chatService.sendeMessage(
          widget.reciverUserID, messageController.text);
      //clear the text controller after sending the message
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set the background color here
        color:
            HexColor.fromHex("#181a1f"), // Specify the desired background color
        child: Column(
          children: [
            MyAppBar(
              chatNAme: widget.reciverUserEmail,
              callIcon: Icons.call,
              callOnPressed: () {},
            ),

            // Use a ListView with reverse property to display messages from the bottom
            Expanded(
              flex: 10,
              child: _buildMessageList(),
            ),

            _buildMessageInput(),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }

// build message list

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.reciverUserID, _fireAuth.currentUser!.uid),
      builder: (context, snapshot) {
        // print("StreamBuilder Triggered");
        if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            "Loading...",
            style: TextStyle(color: textColor),
          );
        }
        // print("Snapshot data: ${snapshot.data}"); // Add this line

        // Scroll to the bottom whenever the data changes
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });

        return ListView(
          controller: _scrollController, //  ScrollController here
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

// build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // print("Data: $data"); // Add this line
    // String fullName = "${data["firstName"]} ${data["lastName"]}";

    //align the message to the right if is the is the current user , otherwise to the left
    var alignment = (data['senderId'] == _fireAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: (data['senderId'] == _fireAuth.currentUser!.uid)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: (data['senderId'] == _fireAuth.currentUser!.uid)
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Text(
              data['senderEmail'].toString(),
              style: TextStyle(color: textColor),
            ),
            const SizedBox(
              height: 5,
            ),
            ChatBubble(message: data['message'])
          ],
        ),
      ),
    );
  }

  // textfiled input
  Widget _buildMessageInput() {
    return MyChatTextField(
      controller: messageController,
      onTap: sendMessage,
    );
  }
}
