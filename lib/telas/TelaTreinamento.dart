import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';

class _TreinamentoState extends State<TelaTreinamento> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CAppBar(
          "Treinamento[Num]",
          backButton: true,
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

class TelaTreinamento extends StatefulWidget {
  State<TelaTreinamento> createState() {
    return _TreinamentoState();
  }
}
