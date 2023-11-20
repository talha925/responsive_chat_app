// import 'package:chatapp/CustomUI/ButtonCard.dart';
// import 'package:chatapp/Model/ChatModel.dart';
// import 'package:chatapp/Screens/Homescreen.dart';
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({Key key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   ChatModel sourceChat;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           itemCount: chatmodels.length,
//           itemBuilder: (contex, index) => InkWell(
//                 onTap: () {
//                   sourceChat = chatmodels.removeAt(index);
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (builder) => Homescreen(
//                                 chatmodels: chatmodels,
//                                 sourchat: sourceChat,
//                               )));
//                 },
//                 child: ButtonCard(
//                   name: chatmodels[index].name,
//                   icon: Icons.person,
//                 ),
//               )),
//     );
//   }
// }

class ChatModel {
  final int id;
  final String name;
  final String lastMessage;
  final String time;
  final String avatar;

  ChatModel({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatar,
  });
}

class ChatService {
  static List<ChatModel> chats = [
    ChatModel(
      id: 1,
      name: 'Alice',
      lastMessage: 'Hello there!',
      time: '9:30 AM',
      avatar: 'alice.jpg',
    ),
    ChatModel(
      id: 2,
      name: 'Bob',
      lastMessage: 'Hi Alice!',
      time: '10:15 AM',
      avatar: 'bob.jpg',
    ),
    ChatModel(
      id: 3,
      name: 'Charlie',
      lastMessage: 'Hey folks!',
      time: '11:45 AM',
      avatar: 'charlie.jpg',
    ),
    // Add more chat models as needed
  ];
  final chat = ChatModel(
    id: 1,
    name: 'Alice',
    lastMessage: 'Hello there!',
    time: '9:30 AM',
    avatar: 'alice.jpg',
  );
}
