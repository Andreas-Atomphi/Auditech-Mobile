import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/Telas.dart';

Color backgroundColor = Color.fromARGB(255, 0, 90, 100);
Brightness theme = Brightness.light;
Color primary = Color.fromARGB(255, 0, 200, 190); //Variável para a cor global
Color accent = Color.fromARGB(255, 0, 150, 160); // Variável para cor secundária

Map<String, Widget Function(BuildContext context)> routes = {
  "principal": (context) => TelaLogin(),
  "boas-vindas": (context) => TelaBoasVindas(),
  "treinamento-aviso": (context) => TelaInstrucoesTreinamento(),
  "treinamento-exemplo": (context) => TelaTreinamentoExemplo(),
  "treinamento-3": (context) => Exercicio3(),
  "resultados": (context) => Resultados(),
};

void main() => setAppup();
MaterialApp aplicativo = MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: "principal",
  routes: routes,
  home: TelaLogin(),
  theme: ThemeData(
    brightness: theme,
    primaryColor: primary,
    accentColor: accent,
    backgroundColor: backgroundColor,
  ),
);

void setAppup() {
  runApp(aplicativo);
}
