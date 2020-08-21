import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/Telas.dart';

void main() => setAppup();

Map<String, Widget Function(BuildContext context)> routes = {
  "exemploPrincipal": (context) => TelaExemplo(),
  "exemplo2": (context) => TelaExemplo2()
};

MaterialApp aplicativo = MaterialApp(
  initialRoute: "principal",
  routes: routes,
  home: TelaExemplo(),
);

void setAppup() {
  runApp(aplicativo);
}
