import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'treinamentos.dart';

class STreinamento9 extends STreinamentoBase<ExercicioCentral> {
  void iniciarExercicio() {
    definirRequisitos(2, exercicios["Ex9"], true);
  }

  @override
  Widget build(BuildContext context) {
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
                  flex: 1,
                ),
                (sequencia > 0)
                    ? textInstruct(
                        "Repita apenas os números que você ouvir na orelha direita")
                    : textInstruct("Preste atenção na explicação."),
                Spacer(
                  flex: 1,
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
          ],
        ),
      ),
    );
  }
}
