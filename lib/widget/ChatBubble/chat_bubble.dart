import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 12), // Adjust padding here
      margin: const EdgeInsets.symmetric(
          vertical: 4), // Optional margin for better separation
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue,
      ),
      child: Text(
        message,
        style: const TextStyle(
            fontSize: 16, color: Colors.white), // Adjust text style here
      ),
    );
  }
}
