import 'dart:async';

import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';

import '../TelaResultados.dart';
import 'package:flutter/material.dart';

abstract class STreinamentoBase extends State {
  CAppBar stbAppBar(context) => CAppBar(
        "Exemplo",
        backButton: true,
        pressBack: voltar(context),
      );
  AssetsAudioPlayer playback = AssetsAudioPlayer();

  void initState() {
    super.initState();
  }

  startTimeout([int milliseconds = 1]) {
    Duration ms = const Duration(milliseconds: 1);
    var duration = ms * milliseconds;
    return new Timer(duration, iniciarExercicio);
  }

  void iniciarExercicio() {}
  voltar(BuildContext context) => Navigator.pop(context);

  void Function() avancar;

  irParaResultados(List respostas, BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => Resultados(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
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
