import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final void Function() aoPressionar;
  final String texto;
  final bool isALink;

  ButtonLogin(this.texto, this.aoPressionar, this.isALink);

  Widget build(BuildContext context) {
    return (isALink)
        ? Align(
            child: Container(
              child: RichText(
                text: TextSpan(
                  text: texto,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          )
        : Align(
            child: Container(
              child: RaisedButton(
                onPressed: aoPressionar,
                child: Text(texto),
                color: Colors.lightBlue,
              ),
            ),
          );
  }
}
