import 'package:AuditechMobile/telas/TelaLogin.dart';
import 'package:flutter/material.dart';
import 'mainData.dart';

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
