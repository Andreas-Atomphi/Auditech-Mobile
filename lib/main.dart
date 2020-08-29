import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/Telas.dart';
import 'package:AuditechMobile/telas/routes.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';

Color backgroundColor = Color.fromARGB(255, 0, 90, 100);
Brightness theme = Brightness.light;
Color primary = Color.fromARGB(255, 0, 200, 190);
Color accent = Color.fromARGB(255, 0, 150, 160);
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
