library tela_treinamento_central;

import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
import 'package:flutter/material.dart';
import 'telasDeExercicio.dart';

class ExercicioCentral extends StatefulWidget {
  final Fase fase;
  ExercicioCentral({this.fase});
  SExercicioBase createState() {
    return <SExercicioBase>[
      SExercicio1(fase),
      SExercicio2(fase),
      SExercicio3(fase),
      SExercicio4(fase),
      SExercicio5(fase),
      SExercicio6(fase),
      SExercicio7(fase),
      SExercicio8(fase),
      SExercicio9(fase),
      SExercicio10(fase),
    ][fase.exercicio.idExercicio - 1];
  }
}
