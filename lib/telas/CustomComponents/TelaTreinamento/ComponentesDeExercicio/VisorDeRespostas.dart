import 'package:flutter/material.dart';

enum VisorDirecao {
  HORIZONTAL,
  VERTICAL,
}

extension visorDirecaoValores on VisorDirecao {
  Axis get value {
    Axis retorno;
    switch (this) {
      case (VisorDirecao.HORIZONTAL):
        retorno = Axis.horizontal;
        break;
      case (VisorDirecao.VERTICAL):
        retorno = Axis.vertical;
        break;
      default:
        retorno = null;
        break;
    }
    return retorno;
  }
}

class VisorDeRespostas extends StatelessWidget {
  final List<String> respostas;
  final bool reverse;
  final VisorDirecao direcao;

  VisorDeRespostas(
    this.respostas, {
    this.reverse = true,
    this.direcao = VisorDirecao.HORIZONTAL,
  });

  @override
  Widget build(BuildContext context) {
    List<Text> text = [
      ...respostas.map(
        (e) => Text(
          (e.toString() != "null") ? e.toString() + " " : " ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),
    ];
    Flex component = (direcao == VisorDirecao.HORIZONTAL)
        ? Row(
            children: [...text],
          )
        : (direcao == VisorDirecao.VERTICAL)
            ? Column(
                children: [...text],
              )
            : null;
    return SingleChildScrollView(
      scrollDirection: direcao.value,
      reverse: reverse,
      child: component,
    );
  }
}
