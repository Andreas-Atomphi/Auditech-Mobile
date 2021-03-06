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

class _STelaBoasVindas extends State<TelaBoasVindas>
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
          http.Response fase;
          http.Response exercicio;
          http.Response resultadoFase;
          http.Response treinamentofase;

          String faseString, exercicioString;
          Future<http.Response> faseFuture = getFase(usuario?.id);
          faseFuture.then(
            (value) {
              fase = value;
              faseString = fase.body;
              if (fase.body !=
                  "Fase para o Usuário ID: ${usuario.id} não encontrado") {
                localFase = Fase.fromJson(jsonDecode(faseString));
                //  * Puxa o exercício
                Future<http.Response> exercicioFuture =
                    getExercicio(localFase.exercicio.idExercicio);
                exercicioFuture.then(
                  (value) {
                    exercicio = value;
                    logPrint(exercicio.body);
                    exercicioString = exercicio.body;
                    localFase.exercicio =
                        Exercicio.fromJson(jsonDecode(exercicioString));

                    logPrint(localFase.exercicio.toJson);

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
                              ...(jsonDecode(treinamentofase.body) as List).map(
                                (e) => TreinamentoFase.fromJson(e),
                              ),
                            ];
                            logPrint([...treinFase.map((e) => e.toJson)]);
                            setState(() {
                              _wait = null;
                            });
                          },
                        );
                      },
                    );
                  },
                );
                logPrint(localFase.toJson);
              } else {
                logPrint("não há fase");
                setState(() {
                  _wait = null;
                });
              }
            },
          );
        }
      },
    );
  }

  List<Widget> widgetTabs;

  int firstBuild = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void sair() {
      Navigator.pop(context);
      Navigator.pop(context);
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
        usr: usuario,
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
  TelaBoasVindas({this.usuario, this.dados});
  _STelaBoasVindas createState() {
    return _STelaBoasVindas();
  }
}
