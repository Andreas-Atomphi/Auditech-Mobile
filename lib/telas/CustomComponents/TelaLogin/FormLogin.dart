import 'package:flutter/material.dart';

import 'ButtonLogin.dart';
import 'TextFieldLogin.dart';

class FormLogin extends StatelessWidget {
  final List<Widget> moreComponents;
  final void Function(String login, String psswd) actionWhenSubmit;
  final void Function() actionWhenRegister;

  List<Widget> get defaultLogin {
    List<TextFieldLogin> loginFields = [
      TextFieldLogin(
        "CPF",
        false,
        TipoEntrada.CPF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      TextFieldLogin(
        "Data de Aniversário",
        true,
        TipoEntrada.DT,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ];
    return [
      loginFields[0],
      loginFields[1],
      Spacer(flex: 2),
      ButtonLogin(
          "Entrar",
          () => actionWhenSubmit(
              loginFields[0].text, loginFields[1].myController.text),
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
