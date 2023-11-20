import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_chat_app/firebase_options.dart';
import 'package:responsive_chat_app/responsive/responsive_layout.dart';
import 'package:responsive_chat_app/splash_screen.dart';

import 'apps/desktop/desktop_scaffold.dart';
import 'responsive/tablet_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
        ),
        home: const ResponsiveLayout(
          mobileScaffold: SplashScreen(),
          tabletScaffold: TabletScaffold(),
          desktopScaffold: DesktopScaffold(),
        ));
  }
}
