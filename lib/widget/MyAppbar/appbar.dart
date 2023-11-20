import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_chat_app/const/const.dart';

import '../MyCircleAvatar/my_circle_avatar.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? chatNAme; // Add this field
  final IconData callIcon;
  final void Function()? callOnPressed;
  const MyAppBar(
      {Key? key, this.chatNAme, required this.callIcon, this.callOnPressed})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: textColor,
            ), // Edit icon
            onPressed: () {
              Navigator.pop(context);
              // Add functionality to edit the profile here
            },
          ),
          MycircleAuvatar(),
          const SizedBox(width: 16.0), // Add some spacing
          Flexible(
            child: Text(
              chatNAme!, // Your user's name
              style: GoogleFonts.lato(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              maxLines: 1, // Set the maximum number of lines
              overflow: TextOverflow
                  .ellipsis, // Display ellipsis (...) when text overflows
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              Icons.search,
              color: textColor,
            ), // Edit icon
            onPressed: () {
              // Add functionality to edit the profile here
            },
          ),
          IconButton(
            icon: Icon(
              callIcon,
              color: textColor,
            ), // Edit icon
            onPressed: () {
              // _makePhoneCall(
              //     '+123456789'); // Replace with the recipient's phone number
              callOnPressed; // Add functionality to edit the profile here
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: textColor,
            ), // Edit icon
            onPressed: () {
              // Add functionality to edit the profile here
            },
          ),
        ],
      ),
    );
  }
}
