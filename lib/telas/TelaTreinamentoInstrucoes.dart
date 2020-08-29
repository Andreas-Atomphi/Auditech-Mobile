import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/Telas.dart';
import 'routes.dart';
import 'package:flutter/material.dart';

class _TreinamentoInstrucoesState extends State<TelaInstrucoesTreinamento> {
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
          "Treinamento[Num]",
          backButton: true,
          pressBack: _backPress,
        ),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            CardInstruct("texto"),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Container(
                  child: RaisedButton(
                    child: Text("Voltar"),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Spacer(
                  flex: 6,
                ),
                Container(
                  child: RaisedButton(
                    child: Text("Pular"),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: routes["treinamento"],
                        ),
                      );
                    },
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  child: RaisedButton(
                    child: Text("Próxima"),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
            Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}

class TelaInstrucoesTreinamento extends StatefulWidget {
  State<TelaInstrucoesTreinamento> createState() {
    return _TreinamentoInstrucoesState();
  }
}
