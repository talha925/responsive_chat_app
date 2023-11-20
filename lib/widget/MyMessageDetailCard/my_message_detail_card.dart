import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_chat_app/const/const.dart';

import '../MyCircleAvatar/my_circle_avatar.dart';

class MyMessageDetailCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final int badgeCount;

  const MyMessageDetailCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: MycircleAuvatar(), // Replace with your avatar widget
          title: Text(
            title,
            style: GoogleFonts.lato(
              color: textColor,
              fontWeight: FontWeight.bold,
              // fontSize: 18,
            ),
          ),

          // Display the title
          subtitle: Text(
            subtitle,
            style: TextStyle(color: textColor),
          ),

          // Display the subtitle
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment:
                CrossAxisAlignment.end, // Align content to the end
            children: [
              // Display the time

              Text(
                time,
                style: GoogleFonts.lato(
                    color: textColor, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 4.0), // Add spacing

              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  badgeCount.toString(), // Display the badge number
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: textColor,
          indent: 80,
          endIndent: 10,
        ),
      ],
    );
  }
}
