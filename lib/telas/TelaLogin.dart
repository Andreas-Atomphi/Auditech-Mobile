import 'dart:convert';
import 'dart:io';

import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaLogin/components.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

class TelaLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    List<TextFieldLogin> loginFields = [
      TextFieldLogin("CPF", false, TipoEntrada.CPF),
      TextFieldLogin("Data de Aniversário", false, TipoEntrada.DT),
    ];

    String cpfFormat(String str) {
      if (str.length < 11) return null;
      String one = str.substring(0, 3);
      String two = str.substring(3, 6);
      String three = str.substring(6, 9);
      String four = str.substring(9, 11);

      return "$one.$two.$three-$four";
    }

    String dtFormat(String str) {
      if (str.length < 10) return null;
      String one = str.substring(0, 2);
      String two = str.substring(2, 4);
      String three = str.substring(4, 8);
      return "$one/$two/$three 00:00:00";
    }

    Future entrar() async {
      /*
      //Formata os valores da TextField
      String cpf = cpfFormat(loginFields[0].text);
      String dtNasc = dtFormat(loginFields[1].text);

      const Map<String, String> corpo = <String, String>{
        "cpf": "123.456.789-00",
        "dataNascimento": "01/01/1990 00:00:00"
      };

      //Define a url e corpo para enviar
      final Uri auditechAPI = Uri.parse(
          "http://hawgamtech.somee.com/AuditechAPI/usuarios/ValidarUsuario");
      final uri = auditechAPI.replace(queryParameters: corpo);

      //Checa se existe
      http.Response existe = await http.get(
        uri,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      print(existe.body);*/
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
            Spacer(flex: 8),
            loginFields[0],
            Spacer(flex: 1),
            loginFields[1],
            Spacer(flex: 1),
            ButtonLogin("Entrar", () => entrar(), false),
            ButtonLogin("Registrar-se", () {}, true),
            Spacer(flex: 1),
            Container(
              child: Text(
                "developed by: H.A.W.Ga.M",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment(-0.9, 1),
            )
          ],
        ),
      ),
    );
  }
}
