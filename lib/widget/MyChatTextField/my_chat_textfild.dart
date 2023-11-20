import 'package:flutter/material.dart';
import 'package:responsive_chat_app/const/const.dart';

class MyChatTextField extends StatefulWidget {
  final void Function()? onTap;
  final TextEditingController controller;
  const MyChatTextField({
    super.key,
    this.onTap,
    required this.controller,
  });

  @override
  State<MyChatTextField> createState() => _MyChatTextFieldState();
}

class _MyChatTextFieldState extends State<MyChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                color: textColor), // Set the text color here
                            controller: widget.controller,
                            decoration: InputDecoration(
                              hintText: 'Type your message... ',
                              hintStyle: TextStyle(color: textColor),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.attach_file,
                            color: textColor,
                          ),
                          onPressed: () {
                            // Handle file attachment
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: textColor,
                          ),
                          onPressed: () {
                            // Handle camera action
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.emoji_emotions,
                            color: textColor,
                          ),
                          onPressed: () {
                            // Handle emoji selection
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.send,
                    color: textColor,
                  ),
                  onPressed: () {
                    widget.onTap
                        ?.call(); // Use widget.onTap to reference the onTap function
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
