import 'dart:convert';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/ApiClasses.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomComponents/TelaBoasVindas/components.dart';
import 'Telas.dart';

class _TelaBoasVindasState extends State<TelaBoasVindas>
    with SingleTickerProviderStateMixin {
  Usuario usuario;
  Fase localFase;
  ResultadoFase resultFase;
  List<TreinamentoFase> treinFase;
  TabController controller;
  Widget _wait = Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
    child: SpinKitRing(
      color: Colors.white,
      size: 50.0,
    ),
  );

  @override
  void initState() {
    super.initState();
    usuario = widget.usuario;
    //  Carrega os dados do usuário
    baixarDados();
    controller = TabController(length: 3, vsync: this);
  }

  void baixarDados() async {
    _wait = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
      child: SpinKitRing(
        color: Colors.white,
        size: 50.0,
      ),
    );

    conectado.then(
      (estaConectado) async {
        if (estaConectado) {
          if (usuario == null) usuario = widget.usuario;
          if (globalUsuario == null) globalUsuario = widget.usuario;
          print(globalUsuario);
          http.Response fase;
          http.Response exercicio;
          http.Response resultadoFase;
          http.Response treinamentofase;

          String faseString, exercicioString;
          Future<http.Response> faseFuture = getFase(usuario?.id);
          faseFuture.then(
            (value) {
              fase = value;
            },
          );
          //  * Cria uma corrente de gets
          faseFuture.then(
            (value) {
              setState(
                () {
                  faseString = fase.body;
                  localFase = Fase.fromJson(jsonDecode(faseString));
                  //  * Puxa o exercício
                  Future<http.Response> exercicioFuture = getExercicio(
                      jsonDecode(faseString)['exercicioIdExercicio']);
                  exercicioFuture.then(
                    (value) {
                      exercicio = value;
                      logPrint(exercicio.body);
                      exercicioString = exercicio.body;
                      localFase.exercicio =
                          Exercicio.fromJson(jsonDecode(exercicioString));

                      logPrint(localFase.exercicio);

                      //  * Puxa um resultado fase de acordo com a fase do usuário
                      Future<http.Response> resultadoFaseFuture =
                          getResultadoFase(localFase.idFase);
                      resultadoFaseFuture.then(
                        (value) {
                          resultadoFase = value;

                          resultFase = ResultadoFase.fromJson(
                            jsonDecode(resultadoFase.body),
                          );

                          // * Puxa um treinamentoFase de acordo com a fase do usuário
                          Future<http.Response> tFFuture =
                              getTreinamentoFase(localFase.idFase);

                          tFFuture.then(
                            (value) {
                              treinamentofase = value;
                              treinFase = <TreinamentoFase>[
                                ...(jsonDecode(treinamentofase.body) as List)
                                    .map(
                                  (e) => TreinamentoFase.fromJson(e),
                                ),
                              ];
                              logPrint(treinFase);
                              setState(() {
                                _wait = null;
                              });
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
              logPrint(localFase);
            },
          );

          List<String> faseBody = [
            faseString,
            exercicioString,
          ];
          widget.dados.setStringList(
            'fase',
            faseBody,
          );
        } else if (widget.dados.containsKey("fase") && !estaConectado) {
          setState(() {
            List<String> dados = widget.dados.getStringList("fase");
            localFase = Fase.fromJson(jsonDecode(dados[0]));
            localFase.exercicio = Exercicio.fromJson(jsonDecode(dados[1]));
            _wait = null;
          });
        }
      },
    );
    logPrint(localFase);
  }

  List<Widget> widgetTabs;

  int firstBuild = 0;

  Future irParaTreino(
    String appbartext, [
    String numtreino = "exemplo-tr",
    Fase mainFase,
    Exercicio mainExercicio,
    BuildContext context,
  ]) async {
    return Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => InstrucoesExercicio(
          appbartext,
          numtreino,
          mainFase,
          mainExercicio,
        ),
      ),
    )
        .then(
      (value) {
        if (value?.runtimeType == (List<TreinamentoFase>().runtimeType))
          baixarDados();
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void sair() {
      () async {
        globalUsuario = null;
        await widget.dados.clear().whenComplete(
          () {
            logPrint("limpo");
            Navigator.pop(context);
            Navigator.pop(context);
          },
        );
      }();
    }

    final List<Map<String, Object>> tabs = const [
      {
        "icon": Icon(
          Icons.home,
        ),
        "text": "Início",
      },
      {
        "icon": Icon(
          Icons.games,
        ),
        "text": "Exercícios",
      },
      {
        "icon": Icon(
          Icons.pie_chart,
        ),
        "text": "Estatísticas",
      },
    ];

    widgetTabs = [
      AbaBoasVindas(),
      AbaTreinamento(
        fase: localFase,
      ),
      AbaEstatisticas(
        treinamentos: treinFase,
      ),
    ];

    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (pcontext) {
            return AlertDialog(
              title: Text("Tem certeza de que deseja sair?"),
              actions: [
                FlatButton(
                  child: Text("Não"),
                  onPressed: () => Navigator.pop(pcontext),
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    SystemNavigator.pop(animated: true);
                  },
                )
              ],
            );
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cloud_download),
          onPressed: (_wait == null)
              ? () {
                  setState(
                    () {
                      baixarDados();
                    },
                  );
                }
              : null,
        ),
        drawer: DrawerWelcome(
          nome: usuario.nome,
          mapDados: [
            {"texto": "Configurações", "metodo": () => null},
            {"texto": "Sobre DPAC", "metodo": () => null},
            {"texto": "Sair", "metodo": sair},
          ],
        ),
        appBar: CAppBar(
          "Auditech",
          tab: (_wait == null)
              ? TabBar(
                  controller: controller,
                  tabs: [
                    ...tabs.map(
                      (e) => Tab(
                        icon: e['icon'],
                        text: e['text'],
                      ),
                    ),
                  ],
                )
              : null,
        ),
        body: Stack(
          children: [
            TabBarView(
              controller: controller,
              children: [...widgetTabs],
            ),
            Align(
              alignment: Alignment(0.85, 0.85),
            ),
            _wait,
          ]..removeWhere((element) => element == null),
        ),
      ),
    );
  }
}

class TelaBoasVindas extends StatefulWidget {
  final Usuario usuario;
  final SharedPreferences dados;
  final _TelaBoasVindasState state = _TelaBoasVindasState();
  TelaBoasVindas({this.usuario, this.dados});
  _TelaBoasVindasState createState() {
    return state;
  }
}
