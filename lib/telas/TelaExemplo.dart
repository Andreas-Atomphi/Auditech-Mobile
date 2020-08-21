import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';

class TelaExemplo extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              "Exemplo",
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
              ),
              Align(
                alignment: Alignment(0, 0.7),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: routes["exemplo2"]));
                  },
                  child: Text("Próxima tela"),
                ),
              )
            ],
          )),
    );
  }
}
