import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';

class _STreinamento9 extends STreinamentoBase<Exercicio9> {
  void iniciarExercicio() {
    definirRequisitos(1, "null", false);
  }

  @override
  Widget build(BuildContext context) {
    defReqs(String l) {
      int respsPerSeq = 2;
      Map lado = {
        "E": [respsPerSeq, exercicios["Ex9"]["Esq"], true],
        "D": [respsPerSeq, exercicios["Ex9"]["Dir"], true],
      };
      setState(
        () {
          definirRequisitos(lado[l][0], lado[l][1], lado[l][2]);
          instanciarPlayback();
        },
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: stbAppBar(context, texto: "Exercicio 9"),
        body: Stack(
          children: [
            Column(
              children: [
                Spacer(
                  flex: 2,
                ),
                VisorDeRespostas(
                  respostasDadasL,
                  direcao: VisorDirecao.HORIZONTAL,
                ),
                TecladoNumerico(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  aoPressionar:
                      (sequencia > 0 || sons[sequencia].contains("Aviso"))
                          ? (arr <= sequencia - 1)
                              ? (String txt) => responder(txt)
                              : null
                          : null,
                  textColor: Colors.white,
                  backgroundColor: secondary,
                  buttonsColor: corDeDestaque,
                ),
              ],
            ),
            if (sequencia == 0) jmpBtn(),

            //Deixa a tela escura com opções de escolha
            if (sequencia == 0 && playBack.playing == false)
              EscolherLado(
                aoPressionarE: () => defReqs("E"),
                aoPressionarD: () => defReqs("D"),
                aviso: textInstruct("Escolha o lado que você deseja exercitar"),
              ),
          ],
        ),
      ),
    );
  }
}

class Exercicio9 extends StatefulWidget {
  STreinamentoBase<Exercicio9> createState() {
    return _STreinamento9();
  }
}
