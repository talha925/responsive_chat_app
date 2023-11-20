import 'package:flutter/material.dart';
import 'package:responsive_chat_app/pages/contact_List/contact_screen.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: myDefaultBAckground,
      // appBar: myAppBar,
      // drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(child: MyContactScreen())
          // Chat Interface (TExt field send button)
          // const MyChatTextField(),
        ],
      ),
    );
  }
}
