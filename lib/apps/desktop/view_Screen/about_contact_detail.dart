import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_chat_app/const/const.dart';
import 'package:responsive_chat_app/widget/MyCircleAvatar/my_circle_avatar.dart';
import 'package:responsive_chat_app/widget/MyTextField/my_textfild.dart';

class AboutContactDetail extends StatelessWidget {
  const AboutContactDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: myDefaultBAckground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Search bar
              const MyTextField(),
              const SizedBox(
                height: 15,
              ),
              // CircleAvatar pic
              MycircleAuvatar(
                radius: 50,
              ),
              const SizedBox(
                height: 8,
              ),

              // Name Sub Detail
              const Text(
                'Dianne Jhonson', // Your user's name
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Junior Developer', // Your subtitle or sub-name
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // Two Icon chat or Video Call
              SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          // margin: EdgeInsets.all(100.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            shape: BoxShape.circle,
                          ),
                          // ignore: prefer_const_constructors
                          child: Icon(
                            CupertinoIcons.chat_bubble_fill,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: VerticalDivider(
                        // color: Colors.black, // color of divider
                        width: 10, // width space of divider
                        thickness: 2, // thickness of divider line
                        indent: 0.02, // spacing at the top of divider
                        endIndent: 0.02, // spacing at the bottom of divider
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          // margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            shape: BoxShape.circle,
                          ),
                          // ignore: prefer_const_constructors
                          child: Center(
                            child: const Icon(
                              CupertinoIcons.videocam_fill,
                              size: 40,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Two Icon view Icon Add or to favorite

              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person,
                      ),
                    ),
                    const Text("View Friends"),
                    const SizedBox(
                      width: 25,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                      ),
                    ),
                    const Text("Add to Friends"),
                  ],
                ),
              ),

              // Name Attachment
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 35, top: 20),
                    child: Text(
                      "Attachment",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.file_copy,
                            ),
                          ),
                          const Text("PDF"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_circle,
                            ),
                          ),
                          const Text("VIDEO"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.library_music_rounded,
                            ),
                          ),
                          const Text("MP3"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.image,
                            ),
                          ),
                          const Text("IMAGE"),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
