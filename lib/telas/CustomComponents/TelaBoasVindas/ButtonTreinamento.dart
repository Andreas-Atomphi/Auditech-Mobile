import 'package:AuditechMobile/main.dart';
import 'package:flutter/material.dart';

class ButtonTreinamento extends StatelessWidget {
  final String texto;
  final void Function() aoPressionar;

  ButtonTreinamento(
    this.texto,
    this.aoPressionar,
  );

  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: aoPressionar,
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        color: Colors.orange,
      ),
    );
  }
}
