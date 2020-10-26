import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/Telas.dart';

Color backgroundColor = Color.fromARGB(255, 0, 90, 100);
Brightness theme = Brightness.light;
Color primary = Color.fromARGB(255, 0, 200, 190); //Variável para a cor global
Color secondary =
    Color.fromARGB(255, 0, 150, 160); // Variável para cor secundária
Color corDeDestaque =
    Color.fromRGBO(255, 152, 0, 1); // Variável para cor de destaque do app

extension MapAddAll on Map<String, Widget Function(BuildContext context)> {
  Map<String, Widget Function(BuildContext context)> generate(
    int length,
    Map<String, Widget Function(BuildContext context)> Function(int i) index,
  ) {
    Map<String, Widget Function(BuildContext context)> toReturn = {};
    for (int i = 1; i <= length; i++) {
      var ind = index(i);
      toReturn[ind.keys.single] = ind.values.single;
    }
    return toReturn;
  }
}

Map<String, Widget Function(BuildContext context)> routesExercicios =
    <String, Widget Function(BuildContext context)>{}.generate(
  9,
  (i) => {
    "treinamento-$i": (context) => ExercicioCentral(i),
  },
);
//  "treinamento-1": (context) => ExercicioCentral(1);

Map<String, Widget Function(BuildContext context)> routes = {
  "principal": (context) => TelaLogin(),
  "boas-vindas": (context) => TelaBoasVindas(),
  "aviso-tr": (context) => TelaInstrucoesTreinamento(),
  "exemplo-tr": (context) => TelaTreinamentoExemplo(),
  ...routesExercicios,
  "resultados": (context) => Resultados(),
};

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
