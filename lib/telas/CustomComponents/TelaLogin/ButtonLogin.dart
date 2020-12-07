import 'package:auditech_mobile/mainData.dart';
import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final void Function() aoPressionar;
  final String texto;
  final bool isALink;
  final Alignment alignment;

  ButtonLogin(
    this.texto,
    this.aoPressionar,
    this.isALink, {
    this.alignment = const Alignment(0, 0),
  });

  Widget build(BuildContext context) {
    return (isALink)
        ? Align(
            alignment: alignment,
            child: Container(
              child: FlatButton(
                hoverColor: Colors.transparent,
                child: Text(
                  texto,
                  style: TextStyle(
                    color: Theme.of(context).buttonColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: aoPressionar,
              ),
            ),
          )
        : Align(
            alignment: alignment,
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
                color: Theme.of(context).buttonColor,
              ),
            ),
          );
  }
}
