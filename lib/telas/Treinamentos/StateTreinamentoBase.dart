import 'dart:async';

import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Telas.dart';

abstract class STreinamentoBase<T extends StatefulWidget> extends State<T>
    with Diagnosticable {
  CAppBar stbAppBar(BuildContext context, {String texto}) => CAppBar(
        texto,
        backButton: true,
        pressBack: () => voltar(context),
      );

  @protected
  Timer startTimeout([int milliseconds = 1]) {
    assert(milliseconds != null);
    Duration ms = const Duration(milliseconds: 1);
    var duration = ms * milliseconds;
    return new Timer(duration, iniciarExercicio);
  }

  @protected
  void iniciarExercicio();

  @protected
  void voltar(BuildContext context) {
    Navigator.pop(context);
  }

  @protected
  void irParaResultados(BuildContext context, {List respostas}) {
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
