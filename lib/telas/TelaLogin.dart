import 'dart:convert';
import 'dart:io';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaLogin/components.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class TelaLogin extends StatelessWidget {
  final TextEditingController controllerCPF = TextEditingController();
  final TextEditingController controllerDT = TextEditingController();
  final DateFormat formatoData = DateFormat("yyyy/MM/dd");

  // Formata o cpf
  String cpfFormat(String str) {
    if (str == null) return null;
    if (str.length < 11 || str.length > 11) return null;
    String n = '[0-9]';
    String formatoCpf = "$n.$n.$n-$n$n";
    if (str.contains(
      RegExp(r'' + formatoCpf),
    )) return str;
    String one = str.substring(0, 3);
    String two = str.substring(3, 6);
    String three = str.substring(6, 9);
    String four = str.substring(9, 11);

    return "$one.$two.$three-$four";
  }

  // Adiciona as barras na data
  String dtFormat(String str) {
    if (str == null) return null;
    if (str.length < 8) return null;
    if (str.contains(
      RegExp('[0-9][0-9][0-9][0-9]\/[0-9][0-9]\/[0-9][0-9]'),
    )) return str;
    String one = str.substring(0, 4);
    String two = str.substring(4, 6);
    String three = str.substring(6, 8);

    return "$one/$two/$three";
  }

  Future<bool> get conectado async {
    try {
      final result =
          await InternetAddress.lookup('http://hawgamtech.somee.com/');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Widget build(BuildContext context) {
    SharedPreferences dados;
    // Entra na conta do usuário
    Future entrar(String log, String snh) async {
      if ((log != null && snh != null) &&
          (log.length >= 11 && snh.length >= 8)) {
        final String dataTeste = formatoData.parse("2006/05/30").toString();
        //Formata os valores da TextField
        String dataOficial =
            formatoData.parse(dtFormat(snh)).toString().substring(
                  0,
                  dataTeste.indexOf(
                    RegExp(r'\s[0-9]'),
                  ),
                );
        /* 
      * Corpo para testes
    final Map<String, dynamic> corpoTestes = <String, dynamic>{
      "cpf": "213.546.879-00",
      "dataNascimento": dataTeste.substring(
        0,
        dataTeste.indexOf(
          RegExp(r'\s[0-9]'),
        ),
      ),
    };
    */
        bool conect = await conectado;
        //  Corpo para envio
        final Map<String, dynamic> corpo = <String, dynamic>{
          "cpf": cpfFormat(log),
          "dataNascimento": dataOficial,
        };
        print(corpo['dataNascimento']);
        print(corpo['cpf']);

        // Executa a requisição
        http.Response existe = await http.get(
          "http://hawgamtech.somee.com/AuditechAPI/usuarios/login/${corpo['cpf']}/${corpo['dataNascimento']}",
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          },
        );
        print(existe.body);
        if (existe.statusCode == 200) {
          print("não é 404");
          if (jsonDecode(existe.body)["idTipoUsuario"] == 2) {
            dados.setString('log', corpo["cpf"]);
            dados.setString('anv', corpo["dataNascimento"]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TelaBoasVindas(
                  usuario: existe.body,
                  dados: (conect) ? null : dados,
                ),
              ),
            );
          }
        }
      }
    }

    () async {
      dados = await SharedPreferences.getInstance();
      if (!dados.containsKey('firstAccess'))
        dados.setBool('firstAccess', false);
      else {
        print("checa os dados");
        if (dados.containsKey('log')) if (dados.containsKey('anv')) {
          if (await conectado)
            entrar(dados.getString('log'), dados.getString('anv'));
        }
      }
    }();

    FormLogin form = FormLogin(
      actionWhenSubmit: (String log, String snh) {
        entrar(log, snh);
      },
    );

    List<Widget> defaultForm = form.defaultLogin([
      controllerCPF,
      controllerDT,
    ]);

    double space = 10;
    double screen = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
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
