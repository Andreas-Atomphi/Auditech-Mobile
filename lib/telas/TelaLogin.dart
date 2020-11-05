import 'dart:io';

import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaLogin/components.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TelaLogin extends StatelessWidget {
  Widget build(BuildContext context) {
    () async {
      SharedPreferences dados = await SharedPreferences.getInstance();
      if (!dados.containsKey('firstAccess'))
        dados.setBool('firstAccess', false);
      else {
        print("checa os dados");
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
      /*final Uri auditechAPI = Uri.parse(
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
      print(existe.body);*/

      Navigator.push(
        context,
        MaterialPageRoute(builder: routes["boas-vindas"]),
      );
    }

    FormLogin form = FormLogin(
      actionWhenSubmit: (String log, String snh) {
        entrar(log, snh);
      },
    );

    List<Widget> defaultForm = form.defaultLogin;

    double space = 10;
    double screen = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: CAppBar("Login"),
        backgroundColor: Color.fromRGBO(22, 71, 85, 1),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 200,
              child: Container(
                width: 300,
                height: 300,
                child: Image.asset("assets/images/Logo_02.jpg"),
              ),
            ),
            Positioned(
              top: screen * 0.42,
              child: Container(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                color: secondary,
                height: screen * 0.45,
                width: MediaQuery.of(context).size.width,
                child: form.setMyComponents(
                  [
                    ...defaultForm,
                  ],
                ),
              ),
            ),
            Container(
              child: Text(
                "desenvolvido por: H.A.W.Ga.M",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment(-0.95, 0.99),
            )
          ],
        ),
      ),
    );
  }
}
