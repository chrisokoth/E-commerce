import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  // controller is what we use to access what the user types in the textfield
  final controller;
  // hintText helps the user know what to type in, it acts as the label, or placeholder
  final String hintText;
  // obsecure text is used in password to help hide the password and disdplay the aesterics when a user enters password
  final bool obsecureText;


  const MyTextfield({super.key,
  required this.controller,
  required this.hintText,
  required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(

                controller: controller,
                obscureText: obsecureText,
                decoration: InputDecoration(
                  // enabled boarder is the boarder that we have around the texfield
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  // focused boarder is the boarder color that will appear when a user focuses on that texfield
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400)),
                  // fill in color is used to show the color that should appear isisde the textboxes
                  fillColor: Colors.grey.shade400,
                  filled: true,
                  hintText: hintText
              
                ),
              ),
            );
  }
}