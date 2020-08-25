import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaLogin/components.dart';
import 'package:AuditechMobile/telas/routes.dart';
import 'package:AuditechMobile/main.dart';

class _LoginState extends State {
  Widget build(BuildContext context) {
    void entrar() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: routes["boas-vindas"]),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Bem-vindo!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: backgroundColor,
        body: FormLogin(
          [
            Spacer(flex: 7),
            TextFieldLogin("Email", false),
            Spacer(flex: 1),
            TextFieldLogin("Senha", true),
            Spacer(flex: 1),
            ButtonLogin("Entrar", () => entrar(), false),
            Spacer(flex: 1),
            ButtonLogin("Registrar-se", entrar, true),
            Spacer(flex: 1),
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
      ),
    );
  }
}

class TelaLogin extends StatefulWidget {
  State createState() {
    return _LoginState();
  }
}
