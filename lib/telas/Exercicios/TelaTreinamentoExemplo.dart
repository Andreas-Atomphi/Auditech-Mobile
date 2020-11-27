import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';
import 'package:auditech_mobile/telas/Exercicios/telasDeExercicio.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';

class _STreinamento extends SExercicioBase {
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
    // ! Por ser uma tela de exemplo aqui não vai ter nada, não use esse código.
  }
}

class TelaTreinamentoExemplo extends StatefulWidget {
  SExercicioBase createState() {
    return _STreinamento();
  }
}
