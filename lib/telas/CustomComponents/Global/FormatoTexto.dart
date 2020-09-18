import 'package:flutter/material.dart';

class CorTexto {
  static final Color normal = Colors.grey[800];
  static final Color destaqueR = Colors.red[800];
  static final Color destaqueG = Colors.green[800];
  static final Color destaqueB = Colors.blue[800];
}

class FormatoTexto {
  //Retorna o estilo de texto usado para título
  static TextStyle title(
          {FontWeight weight = FontWeight.normal,
          Color cor = const Color(0xFF424242)}) =>
      TextStyle(
        color: CorTexto.normal,
        fontSize: 40,
        fontFamily: "OpenSans",
        fontWeight: weight,
      );
  //Retorna o estilo de texto para subtítulo
  static TextStyle subtitulo(
          {Color cor = const Color(0xFF424242),
          FontWeight weight = FontWeight.normal}) =>
      TextStyle(
          color: cor, fontSize: 25, fontFamily: "OpenSans", fontWeight: weight);
  //Retorna o estilo de texto para tópico
  static TextStyle topico(
          {Color cor = const Color(0xFF424242),
          FontWeight weight = FontWeight.normal}) =>
      TextStyle(
          color: cor, fontSize: 21, fontFamily: "OpenSans", fontWeight: weight);
  //Retorna o estilo de texto para corpo do texto
  static TextStyle corpo(
          {Color cor = const Color(0xFF424242),
          FontWeight weight = FontWeight.normal}) =>
      TextStyle(
        color: cor,
        fontSize: 16,
        fontFamily: "OpenSans",
        fontWeight: weight,
      );
}
