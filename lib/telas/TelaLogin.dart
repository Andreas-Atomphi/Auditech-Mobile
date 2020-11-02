import 'dart:convert';
import 'dart:io';

import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaLogin/components.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TelaLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    () async {
      SharedPreferences dados = await SharedPreferences.getInstance();
      if (dados.containsKey('firstAccess'))
        dados.setBool('firstAccess', false);
      else {
        if (dados.containsKey('swq')) if (dados.containsKey('zhn')) {
          try {
            final result =
                await InternetAddress.lookup('http://hawgamtech.somee.com/');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
          } on SocketException catch (_) {
            print('not connected');
          }
        }
      }
    }();
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

    Future entrar(log, snh) async {
      //Formata os valores da TextField
      String cpf = cpfFormat(log);
      String dtNasc = dtFormat(snh);

      const Map<String, String> corpo = <String, String>{
        "cpf": "123.456.789-00",
        "dataNascimento": "01/01/1990 00:00:00"
      };

      //Define a url e corpo para enviar
      final Uri auditechAPI = Uri.parse(
        "http://hawgamtech.somee.com/AuditechAPI/usuarios/ValidarUsuario",
      );
      /*
      HttpClient comunicacao = HttpClient();
      HttpClientRequest apiRequest = await comunicacao.getUrl(auditechAPI);
      apiRequest.add(utf8.encode(jsonEncode(corpo)));
      HttpClientResponse apiResp = await apiRequest.close();
      var reply = await apiResp.transform(utf8.decoder).join();
      comunicacao.close();
      print(reply);
      */
      //Checa se existe
      http.Response existe = await http.get(
        auditechAPI,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      print(existe);

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
            ButtonLogin(
                "Entrar",
                () => entrar(loginFields[0].myController.text,
                    loginFields[1].myController.text),
                false),
            ButtonLogin("Registrar-se", () {}, true),
            Spacer(flex: 1),
            Container(
              child: Text(
                "desenvolvido por: H.A.W.Ga.M",
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
