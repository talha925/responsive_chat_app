import 'package:flutter/material.dart';

import 'view_Screen/about_contact_detail.dart';
import 'view_Screen/drawer.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  DesktopScaffoldState createState() => DesktopScaffoldState();
}

class DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Color.fromARGB(197, 252, 251, 251),
      // appBar: myAppBar,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // chat drawer  // Open drawer
                MyDrawer(),

                // Rest of the chat body
                // Expanded(
                //   flex: 2,
                //   child: ChatPage(
                //     reciverUserId: '',
                //   ),
                // ),

                //about contact detail
                AboutContactDetail(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
