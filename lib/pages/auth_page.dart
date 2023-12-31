import 'package:flutter/material.dart';
import 'package:responsive_chat_app/pages/login_page.dart';
import 'package:responsive_chat_app/pages/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toogleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toogleScreens);
    } else {
      return RegisterPage(
        showLoginPage: toogleScreens,
      );
    }
  }
}
