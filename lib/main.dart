import 'package:flutter/material.dart';
import 'package:AuditechMobile/telas/TelaExemplo.dart';

void main() {
  runApp(StatefulDisplay());
}

//Renderiza as telas
class StatefulDisplay extends StatefulWidget {
  @override
  State<StatefulDisplay> createState() {
    return TelaExemplo();
  }
} // StatefulDisplay
