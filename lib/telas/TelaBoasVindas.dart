import 'dart:convert';
import 'dart:io';

import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'CustomComponents/TelaBoasVindas/components.dart';

class _TelaBoasVindasState extends State<TelaBoasVindas>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int idFase = 1;
  Map localFase;
  @override
  void initState() {
    super.initState();

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

    Future<http.Response> getFase() async {
      http.Response fase = await http.get(
        "http://hawgamtech.somee.com/AuditechAPI/fases/$idFase",
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      return fase;
    }

    () async {
      http.Response fase = await getFase();
      localFase = {
        "fase": fase,
        "json": jsonDecode(fase.body),
      };
      print(localFase);
    }();

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
          appBar: CAppBar("Auditech",
              tab: TabBar(
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
              )),
          body: TabBarView(
            controller: controller,
            children: [
              AbaBoasVindas(),
              AbaTreinamento(),
              AbaEstatisticas(),
            ],
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
