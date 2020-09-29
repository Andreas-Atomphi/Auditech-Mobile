import 'package:AuditechMobile/mainData.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'CustomComponents/TelaBoasVindas/components.dart';

class _TelaBoasVindasState extends State with SingleTickerProviderStateMixin {
  TabController controller;
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

    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Tem certeza de que deseja sair?"),
              actions: [
                FlatButton(
                  child: Text("Não"),
                  onPressed: () => Navigator.pop(context),
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
  State createState() {
    return _TelaBoasVindasState();
  }
}
