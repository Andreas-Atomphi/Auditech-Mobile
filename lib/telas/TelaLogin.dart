import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaLogin/components.dart';

class _LoginState extends State {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue,
          accentColor: Colors.cyan),
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 0, 70, 100),
          body: Stack(
            children: [
              FormLogin(
                [
                  TextFieldLogin("Email", false, Alignment(0, 0),
                      EdgeInsets.only(top: 0, bottom: 60.0)),
                  TextFieldLogin("Senha", true, Alignment(0, 0),
                      EdgeInsets.only(top: 60.0, bottom: 0)),
                  ButtonLogin("Entrar", () {}, Alignment(0, 0),
                      EdgeInsets.only(top: 200, bottom: 0), false),
                  ButtonLogin("Registrar-se", () {}, Alignment(0, 0),
                      EdgeInsets.only(top: 300.0), true),
                  Container(
                    child: Text(
                      "developed by: H.A.W.Ga.M",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    alignment: Alignment(-1, 1),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

class TelaLogin extends StatefulWidget {
  State createState() {
    return _LoginState();
  }
}
