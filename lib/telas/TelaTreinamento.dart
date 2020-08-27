import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';

class _TreinamentoState extends State<TelaTreinamento> {
  @override
  Widget build(BuildContext context) {
    AudioTreinamento audio = AudioTreinamento("audio_cache");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CAppBar("Treinamento[Num]"),
        body: Column(
          children: [
            RaisedButton(
              onPressed: () {
                audio.action("/audios/teste.wma");
              },
              child: Text("tocar"),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaTreinamento extends StatefulWidget {
  State<TelaTreinamento> createState() {
    return _TreinamentoState();
  }
}
