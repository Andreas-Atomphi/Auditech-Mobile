import 'package:auditech_mobile/telas/TelaLogin.dart';
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
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          primaryColor: primary.subRGB(255),
          accentColor: secondary.subRGB(255),
          backgroundColor: backgroundColor,
          brightness: Brightness.dark,
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: backgroundColor,
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
            backgroundColor: secondary,
          ),
        ),
        theme: ThemeData(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          primaryColor: primary,
          accentColor: secondary,
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
            backgroundColor: secondary,
          ),
        ),
      ),
    );
  }
}

void setAppup() {
  runApp(MainApp());
}
