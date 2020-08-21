import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';

class TelaExemplo2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              "Exemplo 2",
              textAlign: TextAlign.center,
            )),
          ),
          body: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Esta tela é um exemplo feita para ser apagada no final do projeto (é necessário deixá-la aqui caso não tenha mais nenhuma tela pronta)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )),
    );
  }
}
