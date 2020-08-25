import 'package:flutter/material.dart';
import 'ButtonWelcome.dart';

List<Widget> bwConjunct = [
  ButtonWelcome(
    "Sobre DPAC",
    () {},
    Colors.blue[500],
    EdgeInsets.all(0),
    Alignment(0, 0),
  ),
  Spacer(
    flex: 1,
  ),
  ButtonWelcome(
    "Treinamentos",
    () {},
    Colors.blue[700],
    EdgeInsets.all(0),
    Alignment(0, 0),
  ),
  Spacer(
    flex: 1,
  ),
  ButtonWelcome(
    "Estatísticas",
    () {},
    Colors.orange[600],
    EdgeInsets.all(0),
    Alignment(0, 0),
  ),
];
