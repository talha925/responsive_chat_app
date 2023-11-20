import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MycircleAuvatar extends StatelessWidget {
  double? radius;
  MycircleAuvatar({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: const AssetImage(
          'assets/profile_default.png'), // Replace with your image asset
      radius: radius, // Adjust the size as needed
    );
  }
}
