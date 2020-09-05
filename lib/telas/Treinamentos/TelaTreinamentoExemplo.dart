import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';

class TreinamentoState extends State {
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
    return TreinamentoState();
  }
}
