import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

Color backgroundColor = Color.fromARGB(255, 0, 90, 100);
Brightness theme = Brightness.light;
Color primary = Color.fromRGBO(0, 200, 190, 1); //Variável para a cor global
Color secondary =
    Color.fromRGBO(0, 150, 160, 1); // Variável para cor secundária
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
  10,
  (i) => {
    "treinamento-$i": (context) => ExercicioCentral(
          i,
        ),
  },
);
//  "treinamento-1": (context) => ExercicioCentral(1);

Map<String, Widget Function(BuildContext context)> routes = {
  "principal": (context) => TelaLogin(),
  "boas-vindas": (context) => TelaBoasVindas(),
  "aviso-tr": (context) => InstrucoesExercicio(),
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

Future<http.Response> getFase(idUsr) async {
  http.Response fase = await http.get(
    "http://hawgamtech.somee.com/AuditechAPI/fases/usuario/$idUsr",
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );
  return fase;
}

Future<http.Response> getExercicio(idExercicio) async {
  http.Response fase = await http.get(
    "http://hawgamtech.somee.com/AuditechAPI/exercicios/$idExercicio",
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );
  return fase;
}

Future<http.Response> getUsuario(String login, String senha) {
  return http.get(
    "http://hawgamtech.somee.com/AuditechAPI/usuarios/login/$login/$senha",
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );
}

Future<http.Response> postResposta(Map<String, dynamic> resposta) {
  return http.post(
    Uri.parse(
      "http://hawgamtech.somee.com/AuditechAPI/treinamentofases",
    ),
    body: jsonEncode(resposta),
    encoding: Encoding.getByName("utf-8"),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.expectHeader: 'application/json'
    },
  );
}

mixin PortraitModeMixin on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }
}

/// Força o modo Retrato
mixin PortraitStatefulModeMixin<T extends StatefulWidget> on State<T> {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    _enableRotation();
  }
}

/// blocks rotation; sets orientation to: portrait
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _enableRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

Future<bool> get conectado async {
  bool toReturn;
  ConnectivityResult coneccao = await Connectivity().checkConnectivity();
  if (coneccao == ConnectivityResult.mobile ||
      coneccao == ConnectivityResult.wifi) {
    toReturn = true;
  } else if (coneccao == ConnectivityResult.none) {
    toReturn = false;
  }
  return toReturn;
}

extension ColorFormula on Color {
  Color sumRGB(int sumnum) {
    int red = (this.red + sumnum > 255)
        ? this.red + (this.red - 255)
        : this.red + sumnum;
    int green = (this.green + sumnum > 255)
        ? this.green + (this.green - 255)
        : this.green + sumnum;
    int blue = (this.blue + sumnum > 255)
        ? this.blue + (this.blue - 255)
        : this.blue + sumnum;
    return Color.fromRGBO(red, green, blue, this.opacity);
  }

  Color sumRGBO(int sumnum) {
    int red = (this.red + sumnum > 255)
        ? this.red + (this.red - 255)
        : this.red + sumnum;
    int green = (this.green + sumnum > 255)
        ? this.green + (this.green - 255)
        : this.green + sumnum;
    int blue = (this.blue + sumnum > 255)
        ? this.blue + (this.blue - 255)
        : this.blue + sumnum;
    double o = (this.opacity + sumnum > 1)
        ? this.opacity + (this.opacity - 1)
        : this.opacity + sumnum;
    return Color.fromRGBO(red, green, blue, o);
  }

  Color sumARGB(int sumnum) {
    int red = (this.red + sumnum > 255)
        ? this.red + (this.red - 255)
        : this.red + sumnum;
    int green = (this.green + sumnum > 255)
        ? this.green + (this.green - 255)
        : this.green + sumnum;
    int blue = (this.blue + sumnum > 255)
        ? this.blue + (this.blue - 255)
        : this.blue + sumnum;
    int a = (this.alpha + sumnum > 255)
        ? this.alpha + (this.alpha - 255)
        : this.alpha + sumnum;
    return Color.fromARGB(a, red, green, blue);
  }

  Color subRGB(int sumnum) {
    int red = (this.red - sumnum < 0) ? this.red - this.red : this.red - sumnum;
    int green = (this.green - sumnum < 0)
        ? this.green - this.green
        : this.green - sumnum;
    int blue =
        (this.blue - sumnum < 0) ? this.blue - this.blue : this.blue - sumnum;
    return Color.fromRGBO(red, green, blue, this.opacity);
  }

  Color subRGBO(int sumnum) {
    int red = (this.red - sumnum < 0) ? this.red - this.red : this.red - sumnum;
    int green = (this.green - sumnum < 0)
        ? this.green - this.green
        : this.green - sumnum;
    int blue =
        (this.blue - sumnum < 0) ? this.blue - this.blue : this.blue - sumnum;
    double o = (this.opacity - sumnum < 0)
        ? this.opacity - this.opacity
        : this.opacity - sumnum;
    return Color.fromRGBO(red, green, blue, o);
  }

  Color subARGB(int sumnum) {
    int red = (this.red - sumnum < 0) ? this.red - this.red : this.red - sumnum;
    int green = (this.green - sumnum < 0)
        ? this.green - this.green
        : this.green - sumnum;
    int blue =
        (this.blue - sumnum < 0) ? this.blue - this.blue : this.blue - sumnum;
    int a = (this.alpha - sumnum < 0)
        ? this.alpha - this.alpha
        : this.alpha - sumnum;
    return Color.fromARGB(a, red, green, blue);
  }

  Color operator +(Color cor) {
    int red = (this.red + cor.red < 255)
        ? this.red + (this.red - 255)
        : this.red + cor.red;
    int green = (this.green + cor.green > 255)
        ? this.green + (this.green - 255)
        : this.green + cor.green;
    int blue = (this.blue + cor.blue > 255)
        ? this.blue + (this.blue - 255)
        : this.blue + cor.blue;
    double o = (this.opacity + cor.opacity > 1)
        ? this.opacity + (this.opacity - 1)
        : this.opacity + cor.opacity;
    return Color.fromRGBO(red, green, blue, o);
  }

  Color operator -(Color cor) {
    int red =
        (this.red - cor.red < 0) ? this.red - this.red : this.red - cor.red;
    int green = (this.green - cor.green < 0)
        ? this.green - this.green
        : this.green - cor.green;
    int blue = (this.blue - cor.green < 0)
        ? this.blue - this.blue
        : this.blue - cor.green;
    double o = (this.opacity - cor.green < 0)
        ? this.opacity - this.opacity
        : this.opacity - cor.green;
    return Color.fromRGBO(red, green, blue, o);
  }
}
