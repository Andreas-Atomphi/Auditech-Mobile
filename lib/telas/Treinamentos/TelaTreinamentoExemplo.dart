import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';

class _STreinamento extends STreinamentoBase<TelaTreinamentoExemplo> {
  @override
  Widget build(BuildContext context) {
    void _backPress() {
      Navigator.pop(context);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CAppBar(
          "Exemplo",
          backButton: true,
          pressBack: _backPress,
        ),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Row(
              children: [
                SideButton("Esquerda", () => null),
                Spacer(
                  flex: 1,
                ),
                SideButton("Direita", () => null),
              ],
            ),
            Spacer(
              flex: 1,
            ),
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

  @override
  void iniciarExercicio() {
    // TODO: implement iniciarExercicio
  }
}

class TelaTreinamentoExemplo extends StatefulWidget {
  STreinamentoBase<TelaTreinamentoExemplo> createState() {
    return _STreinamento();
  }
}
