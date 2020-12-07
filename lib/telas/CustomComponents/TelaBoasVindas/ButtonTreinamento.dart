import 'package:auditech_mobile/mainData.dart';
import 'package:flutter/material.dart';

class ButtonTreinamento extends StatelessWidget {
  final String texto;
  final void Function() aoPressionar;
  final bool _ativado;

  ButtonTreinamento(this.texto, this.aoPressionar, this._ativado);

  ButtonTreinamento ativar(bool a) {
    return ButtonTreinamento(texto, aoPressionar, true);
  }

  ButtonTreinamento desativar(bool a) {
    return ButtonTreinamento(texto, aoPressionar, false);
  }

  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: (_ativado) ? aoPressionar : null,
        child: Text(
          texto,
          style: TextStyle(
            color: (_ativado && aoPressionar != null)
                ? Colors.white
                : Colors.blueGrey[500],
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        color: (_ativado && aoPressionar != null)
            ? corDeDestaque
            : Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
