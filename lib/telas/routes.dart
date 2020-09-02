import 'Telas.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  "principal": (context) => TelaLogin(),
  "boas-vindas": (context) => TelaBoasVindas(),
  "treinamento-aviso": (context) => TelaInstrucoesTreinamento(),
  "treinamento-exemplo": (context) => TelaTreinamentoExemplo(),
  "treinamento-animais": (context) => Exercicio3(),
};
