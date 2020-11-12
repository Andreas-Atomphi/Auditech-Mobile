import 'package:flutter/material.dart';

import 'ButtonLogin.dart';
import 'TextFieldLogin.dart';

class FormLogin extends StatelessWidget {
  final List<Widget> moreComponents;
  final void Function(String login, String psswd) actionWhenSubmit;
  final void Function() actionWhenRegister;

  List<Map<String, dynamic>> textFieldsMap(
      List<TextEditingController> controllers, raio) {
    List<Map<String, dynamic>> toReturn = [
      {
        "wsm": null,
        "icon": Icon(Icons.person),
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
        "icon": Icon(Icons.vpn_key),
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
    toReturn[1]["wsm"] = (value) => actionWhenSubmit(
          <TextEditingController>[toReturn[0]["controller"]][0].text,
          value,
        );
    return toReturn;
  }

  // Retorna um formulário padrão, login senha botão de entrar e registrar.

  List<Widget> defaultLogin(
    List<TextEditingController> controllers,
    String text,
  ) {
    Radius raio = Radius.circular(10);
    List<TextFieldLogin> loginFields = [
      ...fields(
        controllers,
        raio,
        widthScale: 0.8,
      )
    ];
    return [
      loginFields[0],
      loginFields[1],
      Align(
        alignment: Alignment(0, 0),
        child: Text(
          "$text",
          style: TextStyle(color: Colors.amber[500]),
        ),
      ),
      Spacer(flex: 2),
      ButtonLogin(
        "Entrar",
        () => actionWhenSubmit(loginFields[0].text, loginFields[1].text),
        false,
      ),
      ButtonLogin("Registrar-se", () {}, true),
      Spacer(flex: 1),
    ];
  }

  // Retorna apenas as caixas de texto

  List<TextFieldLogin> fields(
    List<TextEditingController> controllers,
    Radius raio, {
    double widthScale = 1,
  }) {
    List<TextFieldLogin> textFields = [
      ...textFieldsMap(controllers, raio).map(
        (e) => TextFieldLogin(
          whenSubmit: e["wsm"],
          widthScale: widthScale,
          action: e["ação"],
          controller: e["controller"],
          dica: e["dica"],
          obscure: e["escondido"],
          tipo: e["tipoEntrada"],
          borderRadius: e["raio"],
        ),
      ),
    ];
    return <TextFieldLogin>[
      ...textFields,
    ];
  }

  //  Retorna as duas caixas de texto e um botão de entrar
  List<Widget> fieldsWithSubmit(
    List<TextEditingController> controllers,
    Radius raio, {
    double widthScale = 1,
    Alignment submitButton,
    String text,
  }) {
    List<TextFieldLogin> loginFields = [
      ...fields(controllers, raio),
    ];
    return <Widget>[
      ...loginFields,
      Align(
        alignment: Alignment(-1, 0),
        child: Text(
          "$text",
          style: TextStyle(color: Colors.amber[500]),
        ),
      ),
      ButtonLogin(
        "Entrar",
        () => actionWhenSubmit(loginFields[0].text, loginFields[1].text),
        false,
        alignment: submitButton,
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
