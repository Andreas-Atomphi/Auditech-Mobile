import 'package:flutter/material.dart';
import 'TextFieldLogin.dart';

class FormLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: [TextFieldLogin("Email", false)],
      ),
    );
  }
}
