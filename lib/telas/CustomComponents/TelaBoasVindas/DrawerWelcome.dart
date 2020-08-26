import 'package:flutter/material.dart';
import 'Conjunct.dart';
import 'ListTileWelcome.dart';

class DrawerWelcome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Logo da Auditech/Hawgam'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ...ltwConjunct.map((e) {
            return ListTileWelcome(e["texto"], () => e["aoTocar"]);
          }).toList(),
        ],
      ),
    );
  }
}
