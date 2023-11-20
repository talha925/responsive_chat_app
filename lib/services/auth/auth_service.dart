// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/fluttertoast_notify.dart';

class AuthService {
  // passwordReset function forgot password
  Future passwordReset(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore:
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text('Password reset Link sent! Check your email'),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // signIn() function
  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // add a new document for the user in users collection if it doesn't already exists
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.uid)
          .set({
        'uid': userCredential.user!.uid,
        'email': email //initial username
        //add any additional fields as neede
      }, SetOptions(merge: true));
    } on FirebaseAuthException catch (e) {
      Message.toastMessage(e.message.toString());

      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      // Handle other exceptions
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  // Sign up function
  Future<void> signUp(
    BuildContext context,
    String email,
    String password,
    String confirmPassword,
    String firstName,
    String lastName,
  ) async {
//
    showDialog(
        context: context,
        builder: (context) => const Center(child: SingleChildScrollView()));

    if (passwordConfirmed(password, confirmPassword)) {
      //try creating the user
      try {
        //create the user
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        //  after creating the user, create a new document on cloud firestore called Users
        // FirebaseFirestore.instance
        //     .collection("Users")
        //     .doc(userCredential.user!.uid)
        //     .set({
        //   'uid': userCredential.user!.uid,
        //   'email': email.split('@')[0], //initial username
        //   //add any additional fields as neede
        // });

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(userCredential.user!.uid)
            .set({
          'uid': userCredential.user!.uid,
          'email': email.split('@')[0],
          'firstName': firstName, // Add first name
          'lastName': lastName, // Add last name
          // add any additional fields as needed
        });

        showDialog(
          context: (context),
          builder: (_) {
            return const AlertDialog(
              content: Text('Sign up successful!'),
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          },
        );
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Passwords do not match!'),
          );
        },
      );
    }
  }

  // Password confirmation check function
  bool passwordConfirmed(
    String password,
    String confirmPassword,
  ) {
    return password == confirmPassword;
  }
}
