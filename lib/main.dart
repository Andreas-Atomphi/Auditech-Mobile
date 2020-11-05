import 'package:auditech_mobile/telas/TelaLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mainData.dart';

void main() {
  setAppup();
}

class MainApp extends StatelessWidget with PortraitModeMixin {
  const MainApp();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "principal",
      routes: routes,
      home: TelaLogin(),
      theme: ThemeData(
        brightness: theme,
        primaryColor: primary,
        accentColor: secondary,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

void setAppup() {
  runApp(MainApp());
}
