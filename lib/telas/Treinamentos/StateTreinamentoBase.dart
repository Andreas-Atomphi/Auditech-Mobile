import 'dart:async';

import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  Iterable<Widget> addDynamicComponents(List<dynamic> respostas) {
    return respostas.map(
      (lay) => (lay.runtimeType == String)
          ? Spacer(flex: int.parse(lay[1]))
          : Row(
              children: [
                ...lay.map(
                  (com) => (com.runtimeType == String)
                      ? Spacer(flex: int.parse(com[1]))
                      : SelectButton(com["nome"], com["método"]),
                )
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
