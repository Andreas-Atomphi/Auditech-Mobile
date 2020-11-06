import 'package:flutter/material.dart';

import 'ButtonLogin.dart';
import 'TextFieldLogin.dart';

class FormLogin extends StatelessWidget {
  final List<Widget> moreComponents;
  final void Function(String login, String psswd) actionWhenSubmit;
  final void Function() actionWhenRegister;

  List<Widget> defaultLogin(List<TextEditingController> controllers) {
    Radius raio = Radius.circular(10);
    List<Map<String, dynamic>> entradas = [
      {
        "controller": controllers[0],
        "dica": "CPF",
        "escondido": false,
        "tipoEntrada": TipoEntrada.CPF,
        "raio": BorderRadius.only(
          topLeft: raio,
          topRight: raio,
        ),
      },
      {
        "controller": controllers[1],
        "dica": "Data de Aniversário",
        "escondido": true,
        "tipoEntrada": TipoEntrada.DT,
        "raio": BorderRadius.only(
          bottomLeft: raio,
          bottomRight: raio,
        ),
      }
    ];
    List<TextFieldLogin> loginFields = [
      ...entradas.map(
        (e) => TextFieldLogin(
          controller: e["controller"],
          dica: e["dica"],
          obscure: e["escondido"],
          tipo: e["tipoEntrada"],
          borderRadius: e["raio"],
        ),
      )
    ];
    return [
      loginFields[0],
      loginFields[1],
      Spacer(flex: 2),
      ButtonLogin(
          "Entrar",
          () => actionWhenSubmit(loginFields[0].text, loginFields[1].text),
          false),
      ButtonLogin("Registrar-se", () {}, true),
      Spacer(flex: 1),
    ];
  }

  FormLogin(
      {this.moreComponents, this.actionWhenSubmit, this.actionWhenRegister});

  FormLogin setMyComponents(List<Widget> components) {
    return FormLogin(
      moreComponents: [...components],
      actionWhenSubmit: actionWhenSubmit,
      actionWhenRegister: actionWhenRegister,
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: [...moreComponents],
    );
  }
}
