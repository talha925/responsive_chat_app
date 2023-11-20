import 'package:flutter/material.dart';
import 'package:responsive_chat_app/const/app_colors.dart';

class DarkRadialBackground extends StatelessWidget {
  final String position;
  final Color color;
  final list = List.generate(
    3,
    (index) => HexColor.fromHex("1D192D"),
  );
  DarkRadialBackground(
      {super.key, required this.color, required this.position});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [...list, color],
        center: (position == "bottomRight")
            ? const Alignment(1.0, 1.0)
            : const Alignment(-1.0, -1.0),
      ),
    )));
  }
}
