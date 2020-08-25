import 'package:flutter/material.dart';

class ButtonWelcome extends StatelessWidget {
  final void Function() aoPressionar;
  final String texto;
  final Color cor;
  final EdgeInsets margem;
  final Alignment alinhar;

  ButtonWelcome(
      this.texto, this.aoPressionar, this.cor, this.margem, this.alinhar);

  Widget build(BuildContext build) {
    return Container(
      width: 120,
      child: MaterialButton(
        onPressed: aoPressionar,
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        minWidth: double.infinity,
        color: cor,
      ),
      margin: margem,
      alignment: alinhar,
    );
  }
}
