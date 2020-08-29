import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';

class CAppBar extends AppBar {
  final String texto;
  final bool centralizar;
  final bool backButton;
  final TabBar tab;
  final void Function() pressBack;

  CAppBar(
    this.texto, {
    this.centralizar = true,
    this.backButton = false,
    this.pressBack,
    this.tab,
  }) : super(
          title: Text(texto),
          centerTitle: centralizar,
          backgroundColor: primary,
          leading: (backButton)
              ? BackButton(
                  onPressed: pressBack,
                )
              : null,
          bottom: tab,
        );
}
