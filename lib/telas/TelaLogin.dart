import 'dart:convert';
import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaLogin/components.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class _STelaLogin extends State<TelaLogin> {
  // Controllers para conseguir os textos
  final TextEditingController controllerCPF = TextEditingController();
  final TextEditingController controllerDT = TextEditingController();

  Map<String, Object> usrExiste = {
    "bool": null,
    "usr": null,
  };
  // Guarda o formato das datas
  final DateFormat formatoData = DateFormat("yyyy/MM/dd");
  // * Variável para saber se o teclado está na tela ou não.
  bool isKeyboardOn;

  bool _wait = true;

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

  // Checa se usuário existe
  Future<Map<String, Object>> usuarioExiste(String log, String snh) async {
    Map<String, Object> toReturn = {
      "bool": false,
      "usr": null,
    };
    if ((log != null && snh != null) && (log.length >= 11 && snh.length >= 8)) {
      logPrint("$log $snh");
      final String dataTeste = formatoData.parse("2006/05/30").toString();
      //Formata os valores da TextField
      String dataOficial =
          formatoData.parse(dtFormat(snh)).toString().substring(
                0,
                dataTeste.indexOf(
                  RegExp(r'\s[0-9]'),
                ),
              );

      //  Corpo para envio
      final Map<String, dynamic> corpo = <String, dynamic>{
        "cpf": cpfFormat(log),
        "dataNascimento": dataOficial,
      };

      logPrint(corpo['dataNascimento']);
      logPrint(corpo['cpf']);

      // Executa a requisição
      http.Response existe =
          await getUsuario(corpo['cpf'], corpo['dataNascimento']);

      logPrint(existe.body);

      if (existe.statusCode == 200) {
        logPrint("200 Ok!");
        // Checa se o usuário existe e se é um paciente
        if (jsonDecode(existe.body)["idTipoUsuario"] == 2) {
          toReturn['bool'] = true;
          toReturn['usr'] = existe;
        }
      }
    }
    return toReturn;
  }

  //  Passa para a próxima tela
  void entrar(http.Response usuario, {BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaBoasVindas(
          usuario: Usuario.fromJson(jsonDecode(usuario.body)),
          dados: dados,
        ),
      ),
    );
  }

  bool firstBuild = true;

  Future<bool> haveData() async {
    dados = await SharedPreferences.getInstance();
    if (!dados.containsKey('firstAccess'))
      dados.setBool('firstAccess', false);
    else {
      logPrint("checa os dados");
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
      if (firstBuild) {
        if (!await conectado) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: routes["sem-conexao"],
            ),
          );
        } else {
          setState(
            () {
              _wait = false;
            },
          );
        }

        if (await haveData()) {
          usuarioExiste(
            dados.getString('log'),
            dados.getString('anv'),
          ).then(
            (value) {
              usrExiste['bool'] = value;
              if (usrExiste['bool'] != null) if (usrExiste['bool'] == true) {
                entrar(usrExiste['usr'], context: context);
              }
            },
          );
        }
      }
    }();

    Future<void> checkAndEnter(log, snh) async {
      var val;
      val = await usuarioExiste(log, snh);
      await usuarioExiste(log, snh).whenComplete(
        () {
          usrExiste = val;
          if (usrExiste['bool'] == false)
            setState(() {});
          else if (usrExiste['bool'] != null) if (usrExiste['bool'] == true) {
            entrar(usrExiste['usr'], context: context);
          }
        },
      );
    }

    var keyboard = MediaQuery.of(context).viewInsets.bottom;
    isKeyboardOn = keyboard > 0;

    FormLogin form = FormLogin(
      actionWhenSubmit: (String log, String snh) async {
        checkAndEnter(log, snh);
      },
    );

    List<TextEditingController> controller = [
      controllerCPF,
      controllerDT,
    ];

    String texto = (usrExiste['bool'] != null)
        ? (usrExiste['bool'] == false)
            ? "Este usuário não existe, corrija seu login e senha e tente novamente."
            : ""
        : "";

    List<Widget> defaultForm = (isKeyboardOn)
        ? form.fieldsWithSubmit(
            controller,
            Radius.circular(10),
            submitButton: Alignment(1, 0),
            text: texto,
          )
        : form.defaultLogin(
            controller,
            texto,
          );

    Size screen = MediaQuery.of(context).size;
    Container loginContainer = Container(
      padding: EdgeInsets.only(top: 30, bottom: 30),
      height: (isKeyboardOn) ? (screen.height * 0.483) : (screen.height * 0.45),
      width: screen.width,
      color: Theme.of(context).accentColor,
      child: form.setMyComponents(
        [
          ...defaultForm,
        ],
      ),
    );

    firstBuild = false;

    return Scaffold(
      appBar: CAppBar("Login"),
      body: Stack(
        children: [
          if (_wait)
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height)
          else ...[
            ButtonLogin(
              "Entrar teste",
              () => checkAndEnter("21354687900", "20060530"),
              false,
              alignment: Alignment(-1, -1),
            ),
            Align(
              alignment: Alignment(0, -0.75),
              child: Container(
                width: tamanhoRelativoL(200, context),
                height: tamanhoRelativoL(200, context),
                child: Image.asset("assets/images/Logo_Transparent.png"),
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
            ),
          ],
        ],
      ),
    );
  }
}

class TelaLogin extends StatefulWidget {
  State<TelaLogin> createState() {
    return _STelaLogin();
  }
}
