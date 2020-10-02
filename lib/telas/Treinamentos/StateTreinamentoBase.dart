import 'dart:async';

import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
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

abstract class STreinamentoBase<T extends StatefulWidget> extends State<T>
    with Diagnosticable {
  Playback playBack = Playback();

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
  Timer startTimeout([int milliseconds = 1]) {
    assert(milliseconds != null);
    Duration ms = const Duration(milliseconds: 1);
    var duration = ms * milliseconds;
    return Timer(duration, iniciarExercicio);
  }

  @protected
  void iniciarExercicio();

  @protected
  void voltar(BuildContext context) {
    playBack.stop();
    Navigator.pop(context);
  }

  Container addDynamicComponents(List<dynamic> respostas, int buttons) {
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.5,
      color: accent,
      child: Column(children: [
        ...respostas.map(
          (lay) => (lay.runtimeType == String)
              ? Spacer(flex: int.parse(lay[1]))
              : Row(children: [
                  ...lay.map(
                    (com) => (com.runtimeType == String)
                        ? Spacer(flex: int.parse(com[1]))
                        : SelectButton(
                            (w * 0.5) * 0.7,
                            (w * 0.5) * ((10 - buttons) * 0.1),
                            com["nome"],
                            com["método"],
                          ),
                  ),
                ]),
        ),
      ]),
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
