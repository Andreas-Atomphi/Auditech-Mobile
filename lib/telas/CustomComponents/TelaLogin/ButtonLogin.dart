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
                hoverColor: Colors.transparent,
                child: Text(
                  texto,
                  style: TextStyle(
                    color: Colors.lightBlue[300],
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
                padding: EdgeInsets.all(12.5),
                onPressed: aoPressionar,
                child: Text(
                  texto,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.lightBlue[300],
              ),
            ),
          );
  }
}
