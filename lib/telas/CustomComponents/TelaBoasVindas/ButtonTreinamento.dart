import 'package:flutter/material.dart';

class _SButtonTreinamento extends State<ButtonTreinamento> {
  String texto;
  void Function() aoPressionar;
  bool ativado = true;

  @override
  void initState() {
    super.initState();
    aoPressionar = widget._aoPressionar;
    texto = widget._texto;
  }

  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: (ativado) ? aoPressionar : null,
        child: Text(
          texto,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        color: Colors.orange,
      ),
    );
  }
}

class ButtonTreinamento extends StatefulWidget {
  final String _texto;
  final void Function() _aoPressionar;

  ButtonTreinamento(this._texto, this._aoPressionar);

  State<ButtonTreinamento> createState() {
    return _SButtonTreinamento();
  }
}
