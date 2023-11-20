import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_chat_app/const/app_colors.dart';
import 'package:responsive_chat_app/const/const.dart';
import 'package:responsive_chat_app/services/auth/auth_service.dart';
import 'package:responsive_chat_app/widget/auth/my_button.dart';
import 'package:responsive_chat_app/widget/auth/text_field.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final lastNamecontroller = TextEditingController();
  final firstNamecontroller = TextEditingController();
  final agecontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    firstNamecontroller.dispose();
    lastNamecontroller.dispose();
    agecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: HexColor.fromHex("#181a1f"),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
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
                  "Register below with your detail  !",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 28,
                    color: textColor,
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),

                Row(
                  children: [
                    Flexible(
                      child: LoginTextField(
                        controller: firstNamecontroller,
                        hintText: "First name",
                        obsecureText: false,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Flexible(
                      child: LoginTextField(
                        controller:
                            lastNamecontroller, // Use a different controller for the second email field
                        hintText: "last name",
                        obsecureText: false,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                //email text field
                LoginTextField(
                    controller: emailcontroller,
                    hintText: "Email ",
                    obsecureText: false),

                SizedBox(
                  height: height * 0.01,
                ),
                //Password Textfield
                LoginTextField(
                  controller: passwordcontroller,
                  hintText: "Password ",
                  obsecureText: true,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                //confirm Password Textfield
                LoginTextField(
                  controller: confirmpasswordcontroller,
                  hintText: "confirm Password ",
                  obsecureText: true,
                ),
                SizedBox(
                  height: height * 0.04,
                ),

                //Sign in Button
                MyButton(
                  text: "Sign Up",
                  ontap: () async {
                    if (AuthService().passwordConfirmed(
                      passwordcontroller.text.trim(),
                      confirmpasswordcontroller.text.trim(),
                    )) {
                      await AuthService().signUp(
                        context,
                        emailcontroller.text.trim(),
                        passwordcontroller.text.trim(),
                        confirmpasswordcontroller.text.trim(),
                        firstNamecontroller.text.trim(), // Add first name
                        lastNamecontroller.text.trim(), // Add last name
                      );
                      // Clear controllers after successful sign-up
                      emailcontroller.clear();
                      passwordcontroller.clear();
                      confirmpasswordcontroller.clear();
                      firstNamecontroller.clear();
                      lastNamecontroller.clear();
                      agecontroller.clear();
                    } else {
                      // Passwords do not match, provide feedback to the user
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Passwords do not match!"),
                        ),
                      );
                    }
                  },
                ),
                //go to register app
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I am a member?",
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.showLoginPage();
                        },
                        child: const Text(
                          "Login now",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
