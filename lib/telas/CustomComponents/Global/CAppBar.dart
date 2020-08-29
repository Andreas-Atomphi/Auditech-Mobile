import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';

class CAppBar extends AppBar {
  final String texto;
  final bool centralizar;
  final bool backButton;

  CAppBar(this.texto, {this.centralizar = true, this.backButton = false})
      : super(
          title: Text(texto),
          centerTitle: centralizar,
          backgroundColor: primary,
          leading: (backButton) ? BackButton() : null,
        );
}
