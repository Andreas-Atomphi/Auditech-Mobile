import 'package:flutter/material.dart';

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
          title: (texto == null)
              ? null
              : Text(
                  texto,
                ),
          centerTitle: centralizar,
          leading: (backButton)
              ? BackButton(
                  onPressed: pressBack,
                )
              : null,
          bottom: tab,
        );
}
