import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_chat_app/widget/utils.dart';

import '../Shapes/background_hexagon.dart';

class SliderCaptionedImage extends StatelessWidget {
  final int index;
  final String caption;
  final String imageUrl;
  const SliderCaptionedImage({
    Key? key,
    required this.index,
    required this.caption,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            child: Center(
              child: Image(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
                height: Utils.screenHeight * 0.6,
              ),
            )),
        Positioned(
          bottom: 20,
          left: 20,
          child: Text(caption,
              style: GoogleFonts.raleway(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white)),
        ),
        index == 0
            ? Positioned(
                bottom: 50,
                right: 30,
                child: Transform.scale(
                  scale: 0.3,
                  child: Transform.rotate(
                    angle: -math.pi / 2,
                    child: CustomPaint(painter: BackgroundHexagon()),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
