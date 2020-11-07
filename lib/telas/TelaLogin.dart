import 'dart:convert';
import 'dart:io';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaLogin/components.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class _STelaLogin extends State<TelaLogin> {
  final TextEditingController controllerCPF = TextEditingController();
  final TextEditingController controllerDT = TextEditingController();
  final DateFormat formatoData = DateFormat("yyyy/MM/dd");
  bool isKeyboardOn;

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
    if (str.length < 8 || str.length > 8) return null;
    if (str.contains(
      RegExp('.*[0-9]\/.*[0-9]\/.*[0-9]'),
    )) return str;
    String one = str.substring(0, 4);
    String two = str.substring(4, 6);
    String three = str.substring(6, 8);

    return "$one/$two/$three";
  }

  entrar(String log, String snh, {BuildContext context}) async {
    if ((log != null && snh != null) && (log.length >= 11 && snh.length >= 8)) {
      print("$log $snh");
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
      bool connect = await conectado;
      //  Corpo para envio
      final Map<String, dynamic> corpo = <String, dynamic>{
        "cpf": cpfFormat(log),
        "dataNascimento": dataOficial,
      };
      print(corpo['dataNascimento']);
      print(corpo['cpf']);

      // Executa a requisição
      http.Response existe =
          await getUsuario(corpo['cpf'], corpo['dataNascimento']);
      print(existe.body);
      if (existe.statusCode == 200) {
        print("200 Ok!");
        if (jsonDecode(existe.body)["idTipoUsuario"] == 2) {
          dados.setString('log', log);
          dados.setString('anv', snh);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaBoasVindas(
                usuario: existe.body,
                dados: dados,
              ),
            ),
          );
        }
      }
    }
  }

  bool firstBuild = true;

  Future<bool> haveData() async {
    dados = await SharedPreferences.getInstance();
    if (!dados.containsKey('firstAccess'))
      dados.setBool('firstAccess', false);
    else {
      print("checa os dados");
      if (dados.containsKey('log')) if (dados.containsKey('anv')) {
        if (await conectado) return true;
      }
    }
    return false;
  }

  SharedPreferences dados;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    () async {
      if (firstBuild) if (await haveData()) {
        entrar(
          dados.getString('log'),
          dados.getString('anv'),
          context: context,
        );
      }
    }();
    var keyboard = MediaQuery.of(context).viewInsets.bottom;
    isKeyboardOn = keyboard > 0;

    FormLogin form = FormLogin(
      actionWhenSubmit: (String log, String snh) {
        entrar(log, snh);
      },
    );

    List<TextEditingController> controller = [
      controllerCPF,
      controllerDT,
    ];

    List<Widget> defaultForm = (isKeyboardOn)
        ? form.fields(
            controller,
            Radius.circular(10),
          )
        : form.defaultLogin(
            controller,
          );

    double screen = MediaQuery.of(context).size.height;
    Container loginContainer = Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      color: secondary,
      height: (isKeyboardOn) ? (screen * 0.483) : (screen * 0.45),
      width: MediaQuery.of(context).size.width,
      child: form.setMyComponents(
        [
          ...defaultForm,
        ],
      ),
    );
    firstBuild = false;
    return MaterialApp(
      home: Scaffold(
        appBar: CAppBar("Login"),
        backgroundColor: Color.fromRGBO(22, 71, 85, 1),
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.75),
              child: Container(
                width: tamanhoRelativoL(200, context),
                height: tamanhoRelativoL(200, context),
                child: Image.asset("assets/images/Logo_02.jpg"),
              ),
            ),
            Column(
              children: [
                Spacer(
                  flex: 1,
                ),
                loginContainer,
                if (isKeyboardOn)
                  Spacer(
                    flex: 1,
                  ),
              ],
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

class TelaLogin extends StatefulWidget {
  State<TelaLogin> createState() {
    return _STelaLogin();
  }
}
