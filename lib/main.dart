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

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
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
      ),
    );
  }
}

void setAppup() {
  runApp(MainApp());
}
