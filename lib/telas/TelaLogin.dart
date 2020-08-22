import 'package:AuditechMobile/main.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaLogin/components.dart';

class _LoginState extends State {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue,
          accentColor: Colors.cyan),
      home: Scaffold(
        body: Stack(children: [
          Align(
            child: FormLogin(),
            alignment: Alignment(0, 0),
          ),
        ]),
      ),
    );
  }
}

class TelaLogin extends StatefulWidget {
  State createState() {
    return _LoginState();
  }
}
