import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  const MyTextField({
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.validator,
    required TextInputType keyboardType,
    InputDecoration? decoration,
  });

  get keyboardType => null;

  get decoration => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 249, 253, 255),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(0.3),
              offset: Offset(0, 3),
              blurRadius: 5,
              spreadRadius: 3,
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: decoration ??
              InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 50.0),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color.fromARGB(169, 106, 196, 207),
                  fontSize: 18.0,
                ),
                border: InputBorder.none,
              ),
          validator: validator,
        ),
      ),
    );
  }
}
