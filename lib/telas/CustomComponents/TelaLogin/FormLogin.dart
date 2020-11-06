import 'package:flutter/material.dart';

import 'ButtonLogin.dart';
import 'TextFieldLogin.dart';

class FormLogin extends StatelessWidget {
  final List<Widget> moreComponents;
  final void Function(String login, String psswd) actionWhenSubmit;
  final void Function() actionWhenRegister;

  List<Map<String, dynamic>> textFieldsMap(
      List<TextEditingController> controllers, raio) {
    return [
      {
        "ação": TextInputAction.next,
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
        "ação": TextInputAction.next,
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
  }

  List<Widget> defaultLogin(List<TextEditingController> controllers) {
    Radius raio = Radius.circular(10);

    List<Map<String, dynamic>> entradas = textFieldsMap(controllers, raio);
    List<TextFieldLogin> loginFields = [
      ...entradas.map(
        (e) => TextFieldLogin(
          widthScale: 0.8,
          action: e['ação'],
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

  List<Widget> fields(List<TextEditingController> controllers, Radius raio) {
    List<TextFieldLogin> textFields = [
      ...textFieldsMap(controllers, raio).map(
        (e) => TextFieldLogin(
          widthScale: 1,
          action: e["ação"],
          controller: e["controller"],
          dica: e["dica"],
          obscure: e["escondido"],
          tipo: e["tipoEntrada"],
          borderRadius: e["raio"],
        ),
      ),
    ];
    return [
      ...textFields,
      ButtonLogin(
        "Entrar",
        () => actionWhenSubmit(textFields[0].text, textFields[1].text),
        false,
        alignment: Alignment(1, 0),
      ),
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
