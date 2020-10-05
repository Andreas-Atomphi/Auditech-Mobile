import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/rendering.dart';

class _STreinamento8 extends STreinamentoBase<Exercicio8> {
  void iniciarExercicio() {
    numRPS = 2;
    respostasDadas = gerarStringRespostas(8);
    respostasDadasL = List.generate(
      10,
      (i) => "",
    );
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
            Spacer(
              flex: 1,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                children: [
                  ...respostasDadasL.map(
                    (e) => Text(
                      (e.toString() != "null") ? e.toString() + " " : " ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TecladoNumerico(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              aoPressionar: (String txt) => avancar(txt),
              textColor: Colors.white,
              backgroundColor: secondary,
              buttonsColor: corDeDestaque,
            ),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(corDeDestaque),
              minHeight: 7,
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio8 extends StatefulWidget {
  STreinamentoBase<Exercicio8> createState() {
    return _STreinamento8();
  }
}
