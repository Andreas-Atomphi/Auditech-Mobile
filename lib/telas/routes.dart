import 'package:AuditechMobile/telas/TelaTreinamento.dart';

import 'Telas.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {
  "principal": (context) => TelaLogin(),
  "boas-vindas": (context) => TelaBoasVindas(),
  "treinamento-1": (context) => TelaTreinamento(),
};
