import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:AuditechMobile/mainData.dart';
import 'treinamentos.dart';
import 'dart:collection';

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
    ][idExercicio - 1];
  }
}
