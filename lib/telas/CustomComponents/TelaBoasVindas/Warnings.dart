import 'package:flutter/material.dart';

class InstructAndGreetings extends StatelessWidget {
  final String texto;

  InstructAndGreetings(this.texto);

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height / 100) * 60,
      child: Card(
        child: Text(texto),
      ),
    );
  }
}
