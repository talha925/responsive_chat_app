import 'package:flutter/material.dart';
import 'package:responsive_chat_app/utils/my_circle_avatar.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: MycircleAuvatar(), // Replace with your avatar widget
          title: const Text("D A S H B O A R D"),
          subtitle: const Text("Hi, I am Dashboard"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment:
                CrossAxisAlignment.end, // Align content to the end
            children: [
              const Text("12:34 PM"), // Replace with your time display widget
              const SizedBox(height: 4.0), // Add spacing
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  "5", // Replace with your badge number
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          indent: 80,
          endIndent: 10,
        ),
      ],
    );
  }
}
