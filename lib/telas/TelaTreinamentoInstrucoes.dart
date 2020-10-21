import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class _TreinamentoInstrucoesState extends State<TelaInstrucoesTreinamento> {
  //Argumentos da clase
  final String irpara;
  final String appbartext;

  //Chamando o construtor da classe
  _TreinamentoInstrucoesState(
      [this.appbartext, //texto da barra do app
      this.irpara =
          "treinamento-exemplo" //A tela que irá quando pressionar o botão de ir para exercício;
      ]);

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
                  CardInstruct(
                    RichText(
                      text: WidgetSpan(
                        child: RichText(
                          text: TextSpan(
                            text: "Descrição do exercício.",
                            style: FormatoTexto.title(weight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
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

  //Chama o construtor da classe
  TelaInstrucoesTreinamento([
    this.appbartext = "Exemplo", //Texto da Appbar
    this.irpara = "treinamento-exemplo", //define qual tela que deve ir
  ]);

  State<TelaInstrucoesTreinamento> createState() {
    return _TreinamentoInstrucoesState(appbartext, irpara);
  }
}
