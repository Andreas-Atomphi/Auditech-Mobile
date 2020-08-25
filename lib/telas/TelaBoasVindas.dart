import 'package:AuditechMobile/main.dart';
import 'package:flutter/material.dart';
import 'CustomComponents/TelaBoasVindas/components.dart';

class _TelaBoasVindasState extends State {
  @override
  Widget build(BuildContext context) {
    List<Widget> components = [
      Spacer(
        flex: 4,
      ),
      InstructAndGreetings(
          "Aqui teremos mensagens de boas-vindas e instruções iniciais"),
      Spacer(
        flex: 1,
      ),
    ];
    for (int i = 0; i < bwConjunct.length; i++) {
      components.add(bwConjunct[i]);
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: backgroundColor,
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
