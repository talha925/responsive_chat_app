import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_chat_app/const/app_colors.dart';
import 'package:responsive_chat_app/const/const.dart';
import 'package:responsive_chat_app/pages/forgot_password.dart';
import 'package:responsive_chat_app/utils/fluttertoast_notify.dart';
import 'package:responsive_chat_app/widget/auth/my_button.dart';
import 'package:responsive_chat_app/widget/auth/text_field.dart';

import '../services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? showRegisterPage;
  const LoginPage({
    super.key,
    required this.showRegisterPage,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color:
            HexColor.fromHex("#181a1f"), // Specify the desired background color

        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),

                  //logo
                  Icon(
                    Icons.lock,
                    size: width * 0.2,
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),

                  //welcome back message
                  Text(
                    "Welcome back, you're been missed !",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 28,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  //email text field

                  LoginTextField(
                    controller: emailcontroller,
                    hintText: "Email ",
                    obsecureText: false,
                  ),

                  //Password Textfield
                  SizedBox(
                    height: height * 0.01,
                  ),
                  //Email Textfield
                  LoginTextField(
                    controller: passwordcontroller,
                    hintText: "Password ",
                    obsecureText: true,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage()));
                        },
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),

                  //Sign in Button
                  MyButton(
                    text: "Sign in",
                    ontap: () {
                      // Get.to(MobileScaffold());
                      if (emailcontroller.text.isEmpty) {
                        Message.toastMessage(
                          'Please enter email',
                        );
                      } else if (passwordcontroller.text.isEmpty) {
                        Message.toastMessage(
                          'Please enter password',
                        );
                      } else if (passwordcontroller.text.length < 6) {
                        Message.toastMessage(
                          'Please enter 6 digit password',
                        );
                      } else {
                        AuthService().signIn(emailcontroller.text.trim(),
                            passwordcontroller.text.trim());
                      }
                    },
                  ),
                  //go to register app
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.showRegisterPage!();
                        },
                        child: const Text(
                          "Register nows ",
                          style: TextStyle(
                            color: Colors.blue,
                            // fontSize: width * 0.2,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
