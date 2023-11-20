import 'package:flutter/material.dart';
import 'package:responsive_chat_app/apps/desktop/view_Screen/drawer.dart';

import '../const/const.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBAckground,
      appBar: myAppBar,
      drawer: const MyDrawer(),
      body: const Column(
        children: [
          // Chat Interface (TExt field send button)
          // MyChatTextField(),

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
