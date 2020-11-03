library tela_treinamento_central;

import 'package:flutter/material.dart';
import 'treinamentos.dart';

class ExercicioCentral extends StatefulWidget {
  final int idExercicio;
  ExercicioCentral(this.idExercicio);
  STreinamentoBase<ExercicioCentral> createState() {
    return [
      STreinamento1(),
      STreinamento2(),
      STreinamento3(),
      STreinamento4(),
      STreinamento5(),
      STreinamento6(),
      STreinamento7(),
      STreinamento8(),
      STreinamento9(),
      STreinamento10(),
    ][idExercicio - 1];
  }
}
