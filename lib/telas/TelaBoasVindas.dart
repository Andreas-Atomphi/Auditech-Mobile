import 'dart:convert';
import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'CustomComponents/TelaBoasVindas/components.dart';

class _TelaBoasVindasState extends State<TelaBoasVindas>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int idFase = 3;
  Widget _wait = Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
    child: SpinKitRing(
      color: Colors.white,
      size: 50.0,
    ),
  );
  Map<String, http.Response> localFase = {};
  @override
  void initState() {
    super.initState();
    //  Carrega os dados do usuário
    () async {
      http.Response fase;
      http.Response exercicio;
      Future<http.Response> faseFuture = getFase(idFase);
      faseFuture.then(
        (value) {
          fase = value;
        },
      );

      await faseFuture.whenComplete(
        () {
          setState(
            () {
              localFase['fase'] = fase;
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
        },
      );

      await exercicioFuture.whenComplete(
        () {
          setState(
            () {
              localFase['exercicio'] = exercicio;
              _wait = null;
            },
          );
          print(localFase);
        },
      );
    }();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void sair() {
      Navigator.pop(context);
    }

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
                      Tab(
                        text: "Início",
                      ),
                      Tab(
                        text: "Treinamentos",
                      ),
                      Tab(
                        text: "Estatísticas",
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
              _wait,
            ]..removeWhere((element) => element == null),
          ),
        ),
      ),
    );
  }
}

class TelaBoasVindas extends StatefulWidget {
  State<TelaBoasVindas> createState() {
    return _TelaBoasVindasState();
  }
}
