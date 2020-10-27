import 'package:AuditechMobile/mainData.dart';
import 'package:flutter/material.dart';

class _SButtonTreinamento extends State<ButtonTreinamento> {
  String texto;
  void Function() aoPressionar;
  bool _ativado;

  @override
  void initState() {
    super.initState();
    aoPressionar = widget._aoPressionar;
    texto = widget._texto;
    _ativado = widget._ativado;
  }

  set ativado(bool a) {
    _ativado = a;
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
        color: (_ativado && aoPressionar != null) ? corDeDestaque : secondary,
      ),
    );
  }
}

class ButtonTreinamento extends StatefulWidget {
  final String _texto;
  final void Function() _aoPressionar;
  final bool _ativado;
  ButtonTreinamento(
    this._texto,
    this._aoPressionar, [
    this._ativado = false,
  ]);
  final _state = _SButtonTreinamento();

  State<ButtonTreinamento> createState() {
    return _state;
  }

  void ativar() {
    _state.ativado = true;
  }

  void desativar() {
    _state.ativado = false;
  }

  bool get estaAtivado {
    return _ativado;
  }
}
