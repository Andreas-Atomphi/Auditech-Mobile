import 'package:flutter/material.dart';

class CardInstruct extends StatelessWidget {
  final Widget texto;

  CardInstruct(this.texto);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height / 100) * 50,
      child: Card(
        child: texto,
      ),
    );
  }
}
