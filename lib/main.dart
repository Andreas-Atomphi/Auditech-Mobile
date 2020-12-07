import 'dart:async';
import 'dart:io';

import 'package:auditech_mobile/telas/TelaLogin.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mainData.dart';

void main() {
  setAppup();
}

class MainApp extends StatelessWidget with PortraitModeMixin {
  const MainApp();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );

    corDeDestaque = (themeMode == ThemeMode.light)
        ? Color.fromRGBO(255, 152, 0, 1)
        : Colors.orange;
    bool conectou;
    Future<bool> _asyncCall = Future.delayed(
      Duration(seconds: 5),
      () {
        return conectado;
      },
    );
    () async {
      conectou = await _asyncCall;
    }();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        color: Colors.blue[900],
        debugShowCheckedModeBanner: false,
        initialRoute: "principal",
        routes: routes,
        home: TelaLogin(),
        themeMode: themeMode,
        // * Tema escuro
        darkTheme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          primaryColor: primary.subRGB(20),
          accentColor:
              secondary.subRGB(150).sumRGB(30).withBlue(50).withGreen(40),
          backgroundColor: backgroundColor.subRGB(150),
          brightness: Brightness.dark,
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
          ),
          buttonColor: primary.subRGB(90).withBlue(130).withGreen(120),
          scaffoldBackgroundColor: backgroundColor.subRGB(150),
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            centerTitle: true,
            color: Colors.blueGrey[900],
            elevation: 0.1,
            textTheme: TextTheme(
              title: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: "OpenSans"),
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelColor: Colors.white,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Theme.of(context).accentColor,
          ),
        ),
        // * Tema claro
        theme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          primaryColor: primary,
          accentColor: secondary,
          buttonColor: primary,
          backgroundColor: backgroundColor,
          brightness: Brightness.light,
          fontFamily: "OpenSans",
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme(
            brightness: Brightness.light,
            centerTitle: true,
            color: primary,
            elevation: 0.1,
            textTheme: TextTheme(
              title: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: "OpenSans"),
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelColor: Colors.white,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}

void setAppup() {
  runApp(MainApp());
}
