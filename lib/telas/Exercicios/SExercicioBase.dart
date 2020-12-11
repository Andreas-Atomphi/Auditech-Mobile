import 'dart:async';
import 'dart:convert';

import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
import 'package:auditech_mobile/telas/Exercicios/telasDeExercicio.dart';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/CustomComponents/Exercicios/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

import '../Telas.dart';

// * Cria uma String no modelo de respostas para a API
String gerarStringRespostas(int qtdRespostas) {
  switch (qtdRespostas) {
    case (null):
      return "";
      break;
    default:
      if (qtdRespostas <= 0) return "";
      break;
  }

  String resps = "";

  for (int i = 0; i < qtdRespostas - 1; i++) {
    resps += "%s|";
  }

  return (resps + "%s");
}

//Concatena Lista com String
extension ListString on List<String> {
  List<String> operator +(String texto) {
    for (int i = 0; i < this.length; i++) {
      this[i] += texto;
    }
    return this;
  }
}

//Concatena String com List
extension StringList on List<String> {
  List<String> operator +(List lista) {
    for (int i = 0; i < lista.length; i++) {
      lista[i] = this + lista[i];
    }
    return lista;
  }
}

//Base de todas as outras telas
abstract class SExercicioBase extends State<ExercicioCentral>
    with Diagnosticable {
  //Variáveis principais
  Fase fase;
  Playback playBack;
  int numRPS = 3;
  List<String> sons = List.generate(1, (i) => "");
  int respostas = 0;
  int sequencia = 0;
  int arr = 0;
  int subarr = 0;
  List<String> respostasDadasL = ["", ""];
  String respostasDadas;
  final TreinamentoFase paraEnviar = TreinamentoFase();

  SExercicioBase(this.fase);

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    //Dá a data de execução
    //String dtExec = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
    //Atribui a data de execução
    paraEnviar.dataExecucao = DateTime.now();
    paraEnviar.fase = fase;
    paraEnviar.exercicio = fase.exercicio;
    logPrint(paraEnviar.toJson);

    // Instancia playBack com um método pra respostas e áudio
    instanciarPlayback();

    // Chama o método iniciarExercicio que deve ser construído em uma subclasse
    iniciarExercicio();
  }

  void instanciarPlayback() {
    playBack = Playback(whenEnd: () => acabarSequencia());
  }

  //Avança para a próxima cabeça
  void acabarSequencia() {
    setState(
      () {
        for (int i = respostas; i < (sequencia) * numRPS; i++) {
          if (podeAvancar("N") != null) {
            podeAvancar("N")();
          }
        }
        if (sequencia < sons.length - 1) {
          //Preenche as respostas restantes com N
          sequencia++;
          subarr = 0;
          respostas = (sequencia - 1) * numRPS;
          tocarSequencia();
        } else {
          enviarRespostas();
        }
      },
    );
  }

  // Define os requisitos para o exerício começar
  @required
  void definirRequisitos(
    int nRPS,
    String path,
    bool play,
  ) async {
    try {
      numRPS = nRPS;
      if (path != null) {
        sons = await listSounds(path);
        respostasDadas = gerarStringRespostas(sons.length - 1);
        respostasDadasL = List.generate(
          sons.length - 1,
          (i) => "",
        );
        if (play == true) playBack.play(sons[0]);
      } else {
        if (play == true) throw Exception("Caminho inválido");
      }
    } catch (e) {
      throw e;
    }

    logPrint("quantidades de som nesse exercícios: ${sons.length}");
  }

  // Um getter dos assets
  Future<String> get manifestJson async {
    return DefaultAssetBundle.of(context).loadString('AssetManifest.json');
  }

  // Lista apenas os sons no caminho definido exercícios
  Future<List> listSounds(path) async {
    String mj = await manifestJson;
    Map<String, dynamic> manifestMap = jsonDecode(mj);

    return manifestMap.keys
        .where((String key) => key.contains(path))
        .where((String key) => key.contains('mp3'))
        .toList();
  }

  // Checa se deve travar os botões ou não
  dynamic Function() podeAvancar(
    String txt, {
    bool twoParams = false,
  }) {
    return (sequencia > 0 && !sons[sequencia].contains("Aviso"))
        ? (arr <= sequencia - 1)
            ? () => responder(txt)
            : null
        : null;
  }

  // Método responsável pelas respostas do usuário
  void responder(String resp) {
    setState(
      () {
        if (sequencia <= respostasDadasL.length) {
          if (subarr <= numRPS - 1)
            respostasDadasL[sequencia - 1] +=
                (subarr < numRPS - 1) ? "$resp-" : resp;
        }

        if (sequencia <= respostasDadasL.length) {
          respostas++;
          arr = respostas ~/ numRPS;
          subarr = respostas % numRPS;
          logPrint(respostasDadasL);
          logPrint(subarr);
        }
      },
    );
  }

  // Toca o som do índice {sequencia} da lista de sons
  void tocarSequencia() {
    playBack.play(sons[sequencia]);
  }

  // Retorna um texto com um estilo pré-definido apenas para esta tela
  Text textInstruct(String txt) {
    return Text(
      txt,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }

  // Retorna uma AppBar com um estilo, texto e ações pré-definido apenas para esta tela
  CAppBar stbAppBar(BuildContext context, {String texto = "exemplo"}) =>
      CAppBar(
        texto,
        backButton: true,
        pressBack: () => voltar(context),
      );

  // Conta uma quantidade de tempo para executar uma ação
  Timer startTimeout(Duration duracao, void Function() executar) {
    assert(
      duracao != null,
      executar != null,
    );
    return Timer(duracao, executar);
  }

  // * Método chamado após o a tela ser carregada, deve ser construído na subclasse
  @protected
  void iniciarExercicio();

  // Volta para a tela de TelaBoasVindas
  Future<bool> voltar(BuildContext context) {
    playBack.pause();
    return showDialog(
      context: context,
      builder: (popcontext) {
        return AlertDialog(
          title: Text("Tem certeza de que deseja sair do exercício?"),
          actions: [
            FlatButton(
              child: Text("Não"),
              onPressed: () {
                playBack.play();
                Navigator.pop(popcontext);
              },
            ),
            FlatButton(
              child: Text("Sim"),
              onPressed: () {
                playBack.dispose();
                Navigator.pop(popcontext);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  // Retorna o botão para pular a explicação do exercício (Introducao.mp3)
  Positioned jmpBtn() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.3,
      bottom: MediaQuery.of(context).size.height * 0.50,
      right: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        child: FlatButton(
          child: Text("Pular explicação"),
          padding: EdgeInsets.zero,
          color: corDeDestaque,
          textColor: Colors.white,
          onPressed: () {
            playBack.stop();
            startTimeout(
              Duration(seconds: 1),
              () {
                setState(
                  () {
                    sequencia = 1;
                    tocarSequencia();
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  // Adiciona os componentes a partir de uma lista, podem ser adicionados botões, spacers ou rows
  Container addDynamicComponents(List<dynamic> respostas) {
    int buttons = 0;
    // Conta os botões a serem adicionados
    for (int i = 0; i < respostas.length; i++) {
      if (respostas[i].runtimeType == List<Object>().runtimeType)
        for (int j = 0; j < respostas[i].length; j++) {
          if (respostas[i][j].runtimeType == <String, Object>{}.runtimeType)
            buttons += 1;
        }
    }
    // Armazena o valor de altura e largura da tela nas variáveis
    double w = MediaQuery.of(context).size.width,
        h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: h * 0.5,
      color: Theme.of(context).accentColor,
      child: Column(
        children: [
          ...respostas.map(
            (lay) {
              // Retorna Row ou Spacer
              Widget toReturn;
              switch (lay.runtimeType) {
                case (String):
                  toReturn = Spacer(flex: int.parse(lay[1]));
                  break;
                default:
                  toReturn = Row(
                    children: [
                      ...lay.map(
                        (com) {
                          // Retorna SelectButton ou Spacer
                          Widget subComponentToReturn;
                          switch (com.runtimeType) {
                            case (String):
                              subComponentToReturn =
                                  Spacer(flex: int.parse(com[1]));
                              break;
                            default:
                              subComponentToReturn = SelectButton(
                                (w * 0.5) * 0.7,
                                tamanhoRelativoL(
                                      (h * 0.5) * (buttons * 0.25),
                                      context,
                                    ) *
                                    0.5 *
                                    ((10 - buttons) * 0.1),
                                com["nome"],
                                com["método"],
                              );
                              break;
                          }
                          return subComponentToReturn;
                        },
                      ),
                    ],
                  );
                  break;
              }
              return toReturn;
            },
          ),
        ],
      ),
    );
  }

  //Auto-descritivo
  void enviarRespostas() async {
    paraEnviar.respostasDadas = sprintf(respostasDadas, respostasDadasL);
    paraEnviar.respostasDadas =
        paraEnviar.respostasDadas.replaceAll(RegExp(r'\|\|'), '|');
    var enviar = paraEnviar.toJson;
    logPrint(enviar["respostaTreino"]);
    enviar.remove('resultadoTreino');
    enviar.remove('idTreinamentoFase');
    var jsonParaEnviar = json.encode(enviar);
    logPrint(jsonParaEnviar);
    var respostaServidor = postResposta(enviar);
    respostaServidor.then((value) {
      logPrint(value.body);
    });
    respostaServidor.then(
      (value) {
        if (value.statusCode >= 200 && value.statusCode < 300) {
          getTreinamentoFase(paraEnviar.fase.idFase).then(
            (value) {
              List mapData = jsonDecode(value.body);
              List<TreinamentoFase> treinamentos = [
                ...mapData.map((e) => TreinamentoFase.fromJson(e)),
              ];
              irParaResultados(context, treinamentos);
            },
          );
        } else {
          catchConnectException(context, value);
        }
      },
    );
  }

  // Auto-descritivo
  void irParaResultados(BuildContext context, List<TreinamentoFase> data) {
    playBack.dispose();
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            Resultados(data),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  WillPopScope myPopScope({Widget home, BuildContext context}) {
    return WillPopScope(
      onWillPop: () => voltar(context),
      child: home,
    );
  }

  @protected
  Widget mainRouteBuild();

  @override
  Widget build(BuildContext context) {
    return myPopScope(
      context: context,
      home: Scaffold(
        appBar: stbAppBar(context,
            texto: "Exercicio ${fase.exercicio.idExercicio}"),
        body: mainRouteBuild(),
      ),
    );
  }
}
