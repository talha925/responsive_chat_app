import 'package:flutter/material.dart';
import 'package:responsive_chat_app/utils/my_chat_textfild.dart';

import '../const/const.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBAckground,
      appBar: myAppBar,
      drawer: myDrawer,
      body: const Column(
        children: [
          // Chat Interface (TExt field send button)
          MyChatTextField(),

          //tile below it

          // Expanded(
          //   child: ListView.builder(
          //       itemCount: 20,
          //       itemBuilder: (context, index) {
          //         return const MyTile();
          //       }),
          // )
        ],
      ),
    );
  }
}
