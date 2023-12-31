import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  const MyTextField({this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 2, left: 4, right: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 8.0), // Add horizontal padding
        decoration: BoxDecoration(
          color: Colors.white, // White background color
          borderRadius: BorderRadius.circular(12.0), // Circular border radius
        ),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Search here',
            border: InputBorder.none, // Hide the default border
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
