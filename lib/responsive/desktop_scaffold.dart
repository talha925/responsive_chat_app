import 'package:flutter/material.dart';
import 'package:responsive_chat_app/utils/my_textfild.dart';

import '../const/const.dart';
import '../utils/my_chat_textfild.dart';
import '../utils/my_circle_avatar.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      // backgroundColor: Color.fromARGB(197, 252, 251, 251),
      // appBar: myAppBar,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Open drawer
                myDrawer,
                // Rest of body
                Expanded(
                  flex: 2,
                  child: Container(
                    color: myCenterBAckground,
                    child: Column(
                      children: [
                        // app bar
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              MycircleAuvatar(),
                              const SizedBox(width: 16.0), // Add some spacing

                              const Text(
                                'Dianne Jhonson', // Your user's name
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 18,
                                ), // Edit icon

                                onPressed: () {
                                  // Add functionality to edit the profile here
                                },
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(
                                  Icons.search,
                                ), // Edit icon

                                onPressed: () {
                                  // Add functionality to edit the profile here
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                ), // Edit icon

                                onPressed: () {
                                  // Add functionality to edit the profile here
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.notifications,
                                ), // Edit icon

                                onPressed: () {
                                  // Add functionality to edit the profile here
                                },
                              )
                            ],
                          ),
                        ),
                        // Chat Interface (TExt field send button)
                        const MyChatTextField(),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: myDefaultBAckground,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          //serch bar
                          const MyTextField(),
                          const SizedBox(
                            height: 15,
                          ),
                          //circleAvatar pic
                          MycircleAuvatar(
                            radius: 50,
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          //Name Sub Detail
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
                            height:
                                60, // Set an appropriate height for the container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.blue[100],
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.chat,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: VerticalDivider(
                                    // color: Colors.black, // color of divider
                                    width: 10, // width space of divider
                                    thickness: 2, // thickness of divider line
                                    indent:
                                        0.02, // spacing at the top of divider
                                    endIndent:
                                        0.02, // spacing at the bottom of divider
                                  ),
                                ),
                                // video call Icon
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.blue[100],
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.video_call,
                                        color: Colors.blue,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Two Icon view Icon Add or to favourite
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: Expanded(
                              flex: 1,
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
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
