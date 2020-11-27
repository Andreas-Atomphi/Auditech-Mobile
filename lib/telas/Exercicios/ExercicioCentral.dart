library tela_treinamento_central;

import 'package:flutter/material.dart';
import 'telasDeExercicio.dart';

class ExercicioCentral extends StatefulWidget {
  final int exercicio;
  final int idFase;
  ExercicioCentral(this.exercicio, {this.idFase});
  SExercicioBase createState() {
    return <SExercicioBase>[
      SExercicio1(),
      SExercicio2(),
      SExercicio3(),
      SExercicio4(),
      SExercicio5(),
      SExercicio6(),
      SExercicio7(),
      SExercicio8(),
      SExercicio9(),
      SExercicio10(),
    ][idFase];
  }
}
