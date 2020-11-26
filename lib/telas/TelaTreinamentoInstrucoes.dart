import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';

import 'CustomComponents/TelaBoasVindas/components.dart';
import 'Telas.dart';

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
    fase = widget.fase;
  }

  @override
  Widget build(BuildContext context) {
    //Método que será chamado quando o botão voltar for pressionado
    _backPress() {
      Navigator.pop(context);
    }

    print("fase: ");
    print(fase);
    //Método que será chamado quando o botão ir para o exercício for pressionado
    void irParaTreino([String treinamento]) {
      faseId = fase["fase"]["idFase"];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: routes[treinamento],
        ),
      );
    }

    // Retorna os componentes para texto
    TextSpan formatRules(String str) {
      String text = str.substring(
        str.indexOf(RegExp(r'\".*\"')) + 1,
        str.indexOf(RegExp(r'\"\}')),
      );

      String size = str.substring(
        str.indexOf(RegExp(r'\:\s.*[0-9]')) + 1,
        str.indexOf(RegExp(r'[0-9]\,')) + 1,
      );
      List<String> texts;
      texts = text.split(
        RegExp(r'\\n'),
      );

      return TextSpan(
        style: TextStyle(
          fontSize: double.parse(size),
          color: Colors.black,
          fontFamily: 'OpenSans',
        ),
        children: [
          ...texts.map((e) => TextSpan(text: e + '\n\n')),
        ],
      );
    }

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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      RichText(
                        text: WidgetSpan(
                          child: RichText(
                            text: formatRules(
                                "${widget.fase['exercicio']['descricaoExercicio']}"),
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
