import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_chat_app/const/app_colors.dart';
import 'package:responsive_chat_app/const/dark_radial_background.dart';
import 'package:responsive_chat_app/pages/main_page.dart';
import 'package:responsive_chat_app/widget/utils.dart';

import '../../widget/Onboarding/image_outlined_button.dart';
import '../../widget/Onboarding/slider_captioned_image.dart';

class OnboardingCarousel extends StatefulWidget {
  const OnboardingCarousel({Key? key}) : super(key: key);

  @override
  OnboardingCarouselState createState() => OnboardingCarouselState();
}

class OnboardingCarouselState extends State<OnboardingCarousel> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            isActive ? HexColor.fromHex("266FFE") : HexColor.fromHex("666A7A"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            DarkRadialBackground(
              color: HexColor.fromHex("#181a1f"),
              position: "bottomRight",
            ),
            Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: Utils.screenHeight *
                        0.6, // Set a specific height or adjust as needed
                    child: PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: const <Widget>[
                        SliderCaptionedImage(
                          index: 0,
                          imageUrl: "assets/slider/slider_three.png",
                          caption: "Chat with Friends,\nStay Connected",
                        ),
                        SliderCaptionedImage(
                          index: 1,
                          imageUrl: "assets/slider/slider_four.png",
                          caption: "Connect\nwith Friends\nInstantly",
                        ),
                        SliderCaptionedImage(
                          index: 2,
                          imageUrl: "assets/slider/slider_one.png",
                          caption: "Stay\nConnected\nEffortlessly",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: _buildPageIndicator(),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const MainPage());
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              HexColor.fromHex("246CFE"),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(
                                  color: HexColor.fromHex("246CFE"),
                                ),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.email, color: Colors.white),
                              Text(
                                '   Continue with Email',
                                style: GoogleFonts.lato(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Utils.screenHeight * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: OutlinedButtonWithImage(
                              imageUrl: "assets/google_icon.png",
                            ),
                          ),
                          SizedBox(width: Utils.screenWidth * 0.02),
                          const Expanded(
                            child: OutlinedButtonWithImage(
                              imageUrl: "assets/facebook_icon.png",
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text(
                          'By continuing you agree Taskez\'s Terms of Services & Privacy Policy.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: 15,
                            color: HexColor.fromHex("666A7A"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
