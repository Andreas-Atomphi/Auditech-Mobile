import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final String dica;
  final bool obscure;
  final Alignment alinhar;
  final EdgeInsets margens;

  TextFieldLogin(this.dica, this.obscure, this.alinhar, this.margens);

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
            fillColor: Colors.white,
            filled: true,
            hintText: dica,
            hintStyle: TextStyle(color: Colors.grey),
            isDense: true,
            contentPadding: EdgeInsets.all(8),
          ),
          obscureText: obscure,
        ),
        margin: margens,
        width: (MediaQuery.of(context).size.width / 100) * 65,
      ),
    );
  }
}
