import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
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
          ],
        ),
      ),
    );
  }
}
