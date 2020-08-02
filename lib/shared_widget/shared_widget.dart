import 'package:flutter/material.dart';
class SharedWidget {
  static textFildLogin({String hint, TextEditingController controller}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.3))),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5))),
        ),
      );

 
}
