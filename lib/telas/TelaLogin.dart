import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaLogin/components.dart';
import 'package:AuditechMobile/mainData.dart';

class TelaLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    void entrar() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: routes["boas-vindas"]),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: CAppBar("Login"),
        backgroundColor: backgroundColor,
        body: FormLogin(
          [
            Spacer(flex: 7),
            TextFieldLogin("Email", false),
            Spacer(flex: 1),
            TextFieldLogin("Senha", true),
            Spacer(flex: 1),
            ButtonLogin("Entrar", () => entrar(), false),
            ButtonLogin("Registrar-se", () {}, true),
            Spacer(flex: 2),
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
