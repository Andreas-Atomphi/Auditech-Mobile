import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/Telas.dart';

Color backgroundColor = Color.fromARGB(255, 0, 90, 100);
Brightness theme = Brightness.light;
Color primary = Color.fromARGB(255, 0, 200, 190); //Variável para a cor global
Color accent = Color.fromARGB(255, 0, 150, 160); // Variável para cor secundária

Map<String, Widget Function(BuildContext context)> routes = {
  "principal": (context) => TelaLogin(),
  "boas-vindas": (context) => TelaBoasVindas(),
  "aviso-tr": (context) => TelaInstrucoesTreinamento(),
  "exemplo-tr": (context) => TelaTreinamentoExemplo(),
  "treinamento-1": (context) => TelaTreinamentoExemplo(),
  "treinamento-2": (context) => Exercicio2(),
  "treinamento-3": (context) => Exercicio3(),
  "treinamento-4": (context) => Exercicio4(),
  "treinamento-5": (context) => Exercicio5(),
  "treinamento-6": (context) => Exercicio6(),
  "treinamento-7": (context) => Exercicio7(),
  "treinamento-8": (context) => Exercicio8(),
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

/*
  Verifica se o tamanho da tela - 30 é menor do que a do que o valor de entrada
  Caso verdadeiro, retorna o tamanho da tela - 30
  Caso falso, retorna o valor de entrada
*/
double tamanhoRelativoL(double valor, BuildContext context) {
  double relativoATela = (MediaQuery.of(context).size.width - 30);
  return (relativoATela < valor) ? relativoATela : valor;
}

double tamanhoRelativoA(double valor, BuildContext context) {
  double relativoATela = (MediaQuery.of(context).size.height - 30);
  return (relativoATela < valor) ? relativoATela : valor;
}

void setAppup() {
  runApp(aplicativo);
}
