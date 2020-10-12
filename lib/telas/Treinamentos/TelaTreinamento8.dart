import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/rendering.dart';

class _STreinamento8 extends STreinamentoBase<Exercicio8> {
  void iniciarExercicio() {
    definirRequisitos(1, 1, "", false);
  }

  @override
  Widget build(BuildContext context) {
    defReqs(int nr, int s, String e, bool p) {
      setState(() {
        definirRequisitos(nr, s, e, true);
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 8"),
        body: Stack(
          children: [
            ...[
              if (sequencia == 0) jmpBtn(),
              Column(
                children: [
                  Spacer(
                    flex: 2,
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
                    aoPressionar: (String txt) => responder(txt),
                    textColor: Colors.white,
                    backgroundColor: secondary,
                    buttonsColor: corDeDestaque,
                  ),
                ],
              ),
            ],
            if (sequencia == 0 && playBack.playing == false) ...[
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  child: Column(
                    children: [
                      Spacer(flex: 3),
                      textInstruct("Escolha um lado para começar o exercício"),
                      Spacer(flex: 2),
                      Row(
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          SideButton("Esquerda",
                              () => defReqs(2, 19, exercicios[1], true)),
                          Spacer(
                            flex: 1,
                          ),
                          SideButton("Direita",
                              () => defReqs(2, 17, exercicios[0], true)),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                      Spacer(flex: 1),
                    ],
                  )),
            ],
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
