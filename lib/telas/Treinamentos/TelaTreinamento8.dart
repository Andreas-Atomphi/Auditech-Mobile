import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';

class _STreinamento8 extends STreinamentoBase<Exercicio8> {
  List<String> respostasDadas = List<String>(4);
  int resp = 0;
  int selec = 0;
  int subselec = 0;

  void avancar(String txt) {
    if (selec < respostasDadas.length - 1) {
      setState(
        () {
          resp++;
          selec = resp ~/ 3;
          subselec = resp % 2;
          print(resp);
          print(selec);
          print(subselec);
        },
      );
    } else {
      irParaResultados(context);
      print(respostasDadas.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 8"),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              "Digite os números que você ouvir no lado {valor}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              children: [
                ...respostasDadas.map(
                  (e) => Text(
                    (e.toString() != "null") ? e.toString() : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
            TecladoNumerico(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              aoPressionar: avancar,
              textColor: Colors.white,
              backgroundColor: accent,
              buttonsColor: primary,
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

  void iniciarExercicio() {
    // TODO: implement iniciarExercicio
  }
}

class Exercicio8 extends StatefulWidget {
  STreinamentoBase<Exercicio8> createState() {
    return _STreinamento8();
  }
}
