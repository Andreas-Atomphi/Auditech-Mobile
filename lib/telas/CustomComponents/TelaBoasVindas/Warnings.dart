import 'package:flutter/material.dart';

class InstructAndGreetings extends StatelessWidget {
  final List<RichText> texto;

  InstructAndGreetings(this.texto);

  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (MediaQuery.of(context).size.height * 0.60),
      child: SingleChildScrollView(
        child: Card(
          child: Column(children: (texto != null) ? texto : null),
        ),
      ),
    );
  }
}
