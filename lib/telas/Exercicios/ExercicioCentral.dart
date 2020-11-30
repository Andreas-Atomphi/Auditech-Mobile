library tela_treinamento_central;

import 'package:flutter/material.dart';
import 'telasDeExercicio.dart';

class ExercicioCentral extends StatefulWidget {
  final int exercicio;
  final int idFase;
  ExercicioCentral({this.exercicio, this.idFase});
  SExercicioBase createState() {
    return <SExercicioBase>[
      SExercicio1(idFase, exercicio),
      SExercicio2(idFase, exercicio),
      SExercicio3(idFase, exercicio),
      SExercicio4(idFase, exercicio),
      SExercicio5(idFase, exercicio),
      SExercicio6(idFase, exercicio),
      SExercicio7(idFase, exercicio),
      SExercicio8(idFase, exercicio),
      SExercicio9(idFase, exercicio),
      SExercicio10(idFase, exercicio),
    ][exercicio - 1];
  }
}
