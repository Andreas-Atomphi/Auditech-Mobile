import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';
import 'package:flutter/material.dart';

import 'CustomComponents/TelaBoasVindas/components.dart';
import 'Telas.dart';

class _SInstrucoesExercicio extends State<InstrucoesExercicio> {
  //Argumentos da clase
  String irpara;
  String appbartext;
  Fase fase;
  Exercicio mainExercicio;

  //Chamando o construtor da classe
  _SInstrucoesExercicio();

  @override
  void initState() {
    super.initState();
    irpara = widget.irpara;
    appbartext = widget.appbartext;
    fase = widget.fase;
    mainExercicio = fase.exercicio;
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
    void irParaTreino(Fase fase) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExercicioCentral(
            fase: fase,
          ),
        ),
      );
    }

    // Retorna os componentes para texto
    TextSpan formatRules(String str) {
      print("executando formatRules");
      print("${mainExercicio.toJson}");
      print(str);
      String text = str.substring(
        str.indexOf(RegExp(r'\".*\"')) + 1,
        str.indexOf(RegExp(r'\"\}')),
      );

      print("primeiro passo");

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
      child: Scaffold(
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
                              "${mainExercicio.descricaoExercicio}"),
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
                onPressed: () => irParaTreino(
                  fase,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class InstrucoesExercicio extends StatefulWidget {
  //Argumentos da classe
  final String appbartext;
  final String irpara;
  final Fase fase;
  final Exercicio exercicio;

  //Chama o construtor da classe
  InstrucoesExercicio([
    this.appbartext = "Exemplo", //Texto da Appbar
    this.irpara = "treinamento-exemplo", //define qual tela que deve ir
    this.fase,
    this.exercicio,
  ]);

  _SInstrucoesExercicio createState() {
    return _SInstrucoesExercicio();
  }
}
