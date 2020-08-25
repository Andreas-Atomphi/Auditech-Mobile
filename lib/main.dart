import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/Telas.dart';
import 'package:AuditechMobile/telas/routes.dart';

Color backgroundColor = Color.fromARGB(255, 0, 70, 100);
Brightness theme = Brightness.light;
Color primary = Colors.lightBlue;
Color accent = Colors.cyan;
void main() => setAppup();
MaterialApp aplicativo = MaterialApp(
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
