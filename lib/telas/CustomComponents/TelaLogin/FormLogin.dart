import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  final List<Widget> components;

  FormLogin(this.components);

  Widget build(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        children: components,
      ),
    );
  }
}
