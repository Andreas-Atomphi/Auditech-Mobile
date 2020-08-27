import 'package:flutter/material.dart';
import 'package:AuditechMobile/main.dart';

class CAppBar extends AppBar {
  final String texto;
  final bool centralizar;

  CAppBar(this.texto, [this.centralizar = true])
      : super(
          title: Text(texto),
          centerTitle: centralizar,
          backgroundColor: primary,
        );
}
