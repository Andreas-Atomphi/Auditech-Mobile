import 'package:AuditechMobile/main.dart';
import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        drawer: DrawerWelcome(),
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
    );
  }
}

class TelaBoasVindas extends StatefulWidget {
  State createState() {
    return _TelaBoasVindasState();
  }
}
