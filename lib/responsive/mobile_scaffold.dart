import 'package:flutter/material.dart';
import 'package:responsive_chat_app/const/const.dart';
import 'package:responsive_chat_app/utils/my_chat_textfild.dart';

import '../utils/my_box.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBAckground,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Column(
        children: [
          //4 box on the top
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              width: double.infinity,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return const MyBox();
                  }),
            ),
          ),

          // Chat Interface (TExt field send button)
          const MyChatTextField(),

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
