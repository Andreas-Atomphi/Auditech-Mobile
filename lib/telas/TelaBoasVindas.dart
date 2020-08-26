import 'package:AuditechMobile/main.dart';
import 'package:flutter/material.dart';
import 'CustomComponents/TelaBoasVindas/components.dart';
import 'CustomComponents/TelaBoasVindas/Conjunct.dart';

class _TelaBoasVindasState extends State {
  @override
  Widget build(BuildContext context) {
    List<Widget> components = [
      Spacer(
        flex: 1,
      ),
      InstructAndGreetings(
          "Aqui teremos mensagens de boas-vindas e instruções iniciais"),
      Spacer(
        flex: 1,
      ),
    ];
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
        drawer: DrawerWelcome(),
        appBar: AppBar(
          title: Text("Bem-vindo [Usuário]"),
          centerTitle: true,
        ),
        body: Column(
          children: components,
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
