import 'package:flutter/material.dart';

class ListTileWelcome extends StatelessWidget {
  final String texto;
  final void Function() aoTocar;

  ListTileWelcome(this.texto, this.aoTocar);

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(texto),
      onTap: aoTocar,
    );
  }
}
