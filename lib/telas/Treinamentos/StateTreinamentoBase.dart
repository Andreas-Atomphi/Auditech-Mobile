import 'dart:async';

import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import '../Telas.dart';

String gerarStringRespostas(int qtdRespostas) {
  String resps = "";
  for (int i = 0; i < qtdRespostas - 1; i++) {
    resps += "%s|";
  }
  return (resps + "%s");
}

extension StringClist on String {
  List<String> concatSList(List<String> lista) {
    for (int i = 0; i < lista.length; i++) {
      lista[i] += this;
    }
    return lista;
  }
}

extension ListCString on List<String> {
  List<String> concatSList(String c) {
    for (int i = 0; i < this.length; i++) {
      this[i] += c;
    }
    return this;
  }
}

abstract class STreinamentoBase<T extends StatefulWidget> extends State<T>
    with Diagnosticable {
  Playback playBack = Playback();

  List<String> sonsSequencia =
      exercicios[exercicios.length - 1].toString().concatSList(
            "Num".concatSList(
              List.generate(
                10,
                (index) => index.toString(),
              ),
            ),
          );

  @override
  void initState() {
    super.initState();
    iniciarExercicio();
  }

  int numRPS = 3;

  int respostas = 0;
  int arr = 0;
  int subarr = 0;

  List<String> respostasDadasL;
  String respostasDadas;

  void avancar(String resp) {
    setState(
      () {
        if (arr < respostasDadasL.length) {
          respostasDadasL[arr] += (subarr < numRPS - 1) ? "$resp-" : resp;
        } else {
          print(sprintf(respostasDadas, respostasDadasL));
        }

        if (arr <= respostasDadasL.length) {
          respostas++;
          arr = respostas ~/ numRPS;
          subarr = respostas % numRPS;
          print(respostasDadasL);
          print(subarr);
        }
      },
    );
  }

  Text textInstruct(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  CAppBar stbAppBar(BuildContext context, {String texto = "exemplo"}) =>
      CAppBar(
        texto,
        backButton: true,
        pressBack: () => voltar(context),
      );

  @protected
  Timer startTimeout(Duration duracao, void Function() executar) {
    assert(
      duracao != null,
      executar != null,
    );
    return Timer(duracao, executar);
  }

  @protected
  void iniciarExercicio();

  @protected
  void voltar(BuildContext context) {
    playBack.stop();
    Navigator.pop(context);
  }

  Container addDynamicComponents(List<dynamic> respostas) {
    int buttons = 0;
    for (int i = 0; i < respostas.length; i++) {
      if (respostas[i].runtimeType == List<Object>().runtimeType)
        for (int j = 0; j < respostas[i].length; j++) {
          if (respostas[i][j].runtimeType == <String, Object>{}.runtimeType)
            buttons += 1;
        }
    }
    print(buttons);
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.5,
      color: secondary,
      child: Column(
        children: [
          ...respostas.map(
            (lay) {
              Widget toReturn;
              switch (lay.runtimeType) {
                case (String):
                  toReturn = Spacer(flex: int.parse(lay[1]));
                  break;
                default:
                  toReturn = Row(
                    children: [
                      ...lay.map(
                        (com) {
                          Widget subComponentToReturn;
                          switch (com.runtimeType) {
                            case (String):
                              subComponentToReturn =
                                  Spacer(flex: int.parse(com[1]));
                              break;
                            default:
                              subComponentToReturn = SelectButton(
                                (w * 0.5) * 0.7,
                                tamanhoRelativoL(
                                      (h * 0.5) * (buttons * 0.25),
                                      context,
                                    ) *
                                    0.5 *
                                    ((10 - buttons) * 0.1),
                                com["nome"],
                                com["método"],
                              );
                              break;
                          }
                          return subComponentToReturn;
                        },
                      ),
                    ],
                  );
                  break;
              }
              return toReturn;
            },
          ),
        ],
      ),
    );
  }

  @protected
  void irParaResultados(BuildContext context, {List respostas}) {
    playBack.stop();
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Resultados(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
