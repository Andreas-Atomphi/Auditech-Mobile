import 'package:flutter/material.dart';

class InstructAndGreetings extends StatelessWidget {
  final RichText texto;

  InstructAndGreetings(this.texto);

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height * 0.80),
      child: Card(
        child: (texto != null) ? texto : null,
      ),
    );
  }
}
