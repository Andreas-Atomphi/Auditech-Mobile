import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';

class TreinamentoStateExemplo extends State {
  final List<Widget> componentes;
  final String exercicio;

  TreinamentoStateExemplo(this.componentes, this.exercicio);

  @override
  Widget build(BuildContext context) {
    void _backPress() {
      Navigator.pop(context);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CAppBar(
          exercicio,
          backButton: true,
          pressBack: _backPress,
        ),
        body: Column(
          children: [
            ...componentes,
            Spacer(
              flex: 1,
            ),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.orange),
              minHeight: 7,
            ),
          ],
        ),
      ),
    );
  }
}

class TelaTreinamentoExemplo extends StatefulWidget {
  State createState() {
    return TreinamentoStateExemplo([
      Spacer(
        flex: 1,
      ),
      Row(
        children: [
          SideButton("Esquerda"),
          Spacer(
            flex: 1,
          ),
          SideButton("Direita"),
        ],
      ),
      Spacer(
        flex: 1,
      ),
    ], "Exercício Exemplo");
  }
}
