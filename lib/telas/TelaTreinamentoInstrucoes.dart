import 'dart:convert';

import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';

import 'CustomComponents/TelaBoasVindas/components.dart';

class _TreinamentoInstrucoesState extends State<TelaInstrucoesTreinamento> {
  //Argumentos da clase
  String irpara;
  String appbartext;
  Map fase;

  //Chamando o construtor da classe
  _TreinamentoInstrucoesState();

  @override
  void initState() {
    super.initState();
    irpara = widget.irpara;
    appbartext = widget.appbartext;
  }

  @override
  Widget build(BuildContext context) {
    //Método que será chamado quando o botão voltar for pressionado
    _backPress() {
      Navigator.pop(context);
    }

    //Método que será chamado quando o botão ir para o exercício for pressionado
    void irParaTreino([String treinamento]) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: routes[treinamento],
        ),
      );
    }

    TextSpan formatRules(String str) {
      final reg = RegExp(
        r"^\*[a-zA-Z]\{.*[a-zA-Z]\:.*\,.*\w*(text)\:.*[^\n]\}[a-zA-Z]\*",
        multiLine: true,
        caseSensitive: true,
      );

      final propertyReg = RegExp(r"\:.*[0-9]\,");
      final textReg = RegExp(r'\".*\"');
      final boldReg = RegExp(r'\*b\{.*\}b\*');

      String prop = propertyReg.stringMatch("$str");
      String tex = textReg.stringMatch("$str");
      prop = prop.substring(
        2,
        prop.indexOf(RegExp(r"\,")),
      );
      String bolds;
      tex = tex.substring(1, tex.length - 1);
      //tex.substring(tex.indexOf(), );

      print(tex);

      for (int i = 0; i < 5; i++) {
        final String absReg = r'\*b\{' + '$i';
        final String reg = r'\*b\{' + '$i';
        final String reg2 = r'' + '$i' + r'\}b\*';
        final RegExp boldReg2 = RegExp(reg);
        final RegExp boldReg3 = RegExp(reg2);
        final RegExp absRegExp = RegExp(
          absReg,
          multiLine: true,
          caseSensitive: true,
        );
        var left = tex.indexOf(
          boldReg2,
        );
        var right = tex.indexOf(
          boldReg3,
        );
        print(left);
        print(right);
        print(boldReg2);
        print(boldReg3);

        bolds = tex;
        if (left >= 0 && right >= 0) {
          print(
            bolds.substring(
              bolds.indexOf(
                    boldReg2,
                  ) +
                  4,
              bolds.indexOf(
                boldReg3,
              ),
            ),
          );
          print(bolds.indexOf(
            absRegExp,
          ));
          bolds = bolds.replaceAll(
            absRegExp,
            bolds.substring(
              bolds.indexOf(
                    boldReg2,
                  ) +
                  4,
              bolds.indexOf(
                boldReg3,
              ),
            ),
          );
        }
      }

      print(bolds);

      return TextSpan(
          style: TextStyle(
            fontSize: double.parse(prop),
          ),
          text: tex);
    }

    formatRules("${widget.fase['exercicio']['descricaoExercicio']}");

    return WillPopScope(
      onWillPop: () => _backPress(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: backgroundColor, //define a cor de fundo
          appBar: CAppBar(
            //Chama o componente CAppBar (para dúvidas: Ctrl+Click no nome da classe)
            appbartext, //Texto da appbar
            backButton: true, //Define se CAppBar terá ou não um botão voltar
            pressBack: _backPress, //para quando o botão voltar for pressionado
          ),
          body: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              InstrucControll(
                  ScrollableCardColumn(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    children: [
                      RichText(
                        text: WidgetSpan(
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "${widget.fase['exercicio']['descricaoExercicio']}",
                              style:
                                  FormatoTexto.corpo(weight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  corDeDestaque,
                  secondary,
                  Colors.white),
              Spacer(
                flex: 1,
              ),
              Container(
                width: 200,
                height: 50,
                child: FlatButton(
                  child: Text(
                    "Ir para o exercício",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  color: corDeDestaque,
                  onPressed: () => irParaTreino(irpara),
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaInstrucoesTreinamento extends StatefulWidget {
  //Argumentos da classe
  final String appbartext;
  final String irpara;
  final Map fase;

  //Chama o construtor da classe
  TelaInstrucoesTreinamento([
    this.appbartext = "Exemplo", //Texto da Appbar
    this.irpara = "treinamento-exemplo", //define qual tela que deve ir
    this.fase,
  ]);

  State<TelaInstrucoesTreinamento> createState() {
    return _TreinamentoInstrucoesState();
  }
}
