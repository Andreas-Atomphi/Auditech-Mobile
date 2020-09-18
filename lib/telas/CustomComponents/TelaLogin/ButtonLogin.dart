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
              child: FlatButton(
                child: Text(
                  texto,
                  style: TextStyle(
                    color: Colors.lightBlue[600],
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: aoPressionar,
              ),
            ),
          )
        : Align(
            child: Container(
              child: RaisedButton(
                onPressed: aoPressionar,
                child: Text(
                  texto,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlue[600],
              ),
            ),
          );
  }
}
