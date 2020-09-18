import 'package:AuditechMobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';

class _STreinamento5 extends State {
  List<String> respostasDadas = List<String>(4);
  List<int> respostasCertas = [0, 6, 7, 5];
  int selec = 0;

  void avancar(String txt) {
    if (selec < respostasCertas.length - 1) {
      setState(() {
        respostasDadas[selec] = txt;
        selec++;
      });
    } else {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Resultados(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
      print(respostasDadas.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    void _backPress() {
      Navigator.pop(context);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: CAppBar(
          "Exercício 5",
          backButton: true,
          pressBack: _backPress,
        ),
        body: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            Text(
              "Digite os números que você ouvir no lado {valor}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Row(
              children: [
                ...respostasDadas.map(
                  (e) => Text(
                    (e.toString() != "null") ? e.toString() : "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
            TecladoNumerico(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              aoPressionar: avancar,
              textColor: Colors.white,
              backgroundColor: accent,
              buttonsColor: primary,
            ),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.orange),
              minHeight: 7,
            ),
          ],
        ),
      ),
    );
  }
}

class Exercicio5 extends StatefulWidget {
  State createState() {
    return _STreinamento5();
  }
}
