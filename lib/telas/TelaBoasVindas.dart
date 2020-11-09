import 'dart:convert';
import 'package:auditech_mobile/mainData.dart';
import 'package:auditech_mobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:auditech_mobile/telas/Telas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'CustomComponents/TelaBoasVindas/components.dart';

class _TelaBoasVindasState extends State<TelaBoasVindas>
    with SingleTickerProviderStateMixin {
  String usuario;
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
  Map<String, String> localFase = {};

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
    bool estaConectado = await conectado;
    print(estaConectado);

    await conectado.whenComplete(
      () async {
        print("teste");
        if (estaConectado) {
          usuario = widget.usuario;
          Map localUsuario = jsonDecode(usuario);
          int idUsuario = localUsuario["idUsuario"];

          http.Response fase;
          http.Response exercicio;
          Future<http.Response> faseFuture = getFase(idUsuario);
          faseFuture.then(
            (value) {
              fase = value;
            },
          );

          await faseFuture.whenComplete(
            () {
              setState(
                () {
                  localFase['fase'] = fase.body;
                },
              );
              print(localFase);
            },
          );

          Future<http.Response> exercicioFuture =
              getExercicio(jsonDecode(fase.body)['exercicioIdExercicio']);
          exercicioFuture.then(
            (value) {
              exercicio = value;
              print(exercicio.body);
            },
          );

          await exercicioFuture.whenComplete(
            () {
              setState(
                () {
                  localFase['exercicio'] = exercicio.body;
                  _wait = null;
                },
              );
              print(localFase);
            },
          );
          List<String> faseBody = [
            localFase['fase'],
            localFase['exercicio'],
          ];
          widget.dados.setStringList(
            'fase',
            faseBody,
          );
        } else if (widget.dados.containsKey("fase") && !estaConectado) {
          setState(() {
            List<String> dados = widget.dados.getStringList("fase");
            localFase['fase'] = dados[0];
            localFase['exercicio'] = dados[1];
            _wait = null;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    //  Carrega os dados do usuário
    baixarDados();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void sair() async {
      await widget.dados.clear().whenComplete(
        () {
          print("limpo");
          Navigator.pop(context);
        },
      );
    }

    final List<Map<String, Object>> tabs = const [
      {
        "icon": Icon(Icons.home),
        "text": "Início",
      },
      {
        "icon": Icon(Icons.games),
        "text": "Exercícios",
      },
      {
        "icon": Icon(Icons.pie_chart),
        "text": "Estatísticas",
      },
    ];

    /*
    int idExercicio = 1;
    String cla = 'STreinamento$idExercicio';
    print();
    */

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
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: backgroundColor,
          drawer: DrawerWelcome(
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
                children: [
                  AbaBoasVindas(),
                  AbaTreinamento(fase: localFase),
                  AbaEstatisticas(),
                ],
              ),
              Align(
                alignment: Alignment(0.85, 0.85),
                child: FloatingActionButton(
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
              ),
              _wait,
            ]..removeWhere((element) => element == null),
          ),
        ),
      ),
    );
  }
}

class TelaBoasVindas extends StatefulWidget {
  final String usuario;
  final SharedPreferences dados;
  TelaBoasVindas({this.usuario, this.dados});
  State<TelaBoasVindas> createState() {
    return _TelaBoasVindasState();
  }
}
