import 'package:flutter/material.dart';
import 'Conjunct.dart';
import 'ListTileWelcome.dart';

class DrawerWelcome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: Ink(
        color: Color.fromARGB(255, 0, 150, 140),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Logo_02.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              child: null,
            ),
            ...ltwConjunct.map((e) {
              return ListTileWelcome(e["texto"], () => e["aoTocar"]);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
