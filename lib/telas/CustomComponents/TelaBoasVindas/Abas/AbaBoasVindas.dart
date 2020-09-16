import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class AbaBoasVindas extends StatelessWidget {
  Widget build(BuildContext context) {
    Color corTexto = Colors.grey[800];
    Color corD1 = Colors.red[800];

    TextStyle title({FontWeight weight = FontWeight.normal}) => TextStyle(
          color: Colors.grey[800],
          fontSize: 40,
          fontFamily: "OpenSans",
          fontWeight: weight,
        );

    TextStyle subtitulo(
            {Color cor = const Color(0xFF424242),
            FontWeight weight = FontWeight.normal}) =>
        TextStyle(
            color: cor,
            fontSize: 25,
            fontFamily: "OpenSans",
            fontWeight: weight);

    TextStyle topico(
            {Color cor = const Color(0xFF424242),
            FontWeight weight = FontWeight.normal}) =>
        TextStyle(
            color: cor,
            fontSize: 21,
            fontFamily: "OpenSans",
            fontWeight: weight);

    TextStyle corpo(
            {Color cor = const Color(0xFF424242),
            FontWeight weight = FontWeight.normal}) =>
        TextStyle(
          color: cor,
          fontSize: 16,
          fontFamily: "OpenSans",
          fontWeight: weight,
        );

    return Column(
      children: [
        Spacer(
          flex: 1,
        ),
        InstructAndGreetings(
          [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Bem-vindo!\n\n\n",
                    style: title(weight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        "Olá, bem-vindo ao Auditech, o seu app de tratamento ao DPAC, Segue abaixo as instruções de como usar o app\n\n",
                    style: corpo(),
                  ),
                ],
              ),
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Estatísticas\n",
                    style: subtitulo(weight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text:
                            "Nessa aba fica registrado sua pontuação, e te informa se você está progredindo, regredindo ou parado. Esta aba é dividida em duas seções, sendo:\n\n",
                        style: corpo(),
                      ),
                      TextSpan(
                        text: "Estatística global\n",
                        style: topico(weight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                "Aqui fica a conclusão das suas pontuações nos exercícios, a partir da conclusão é informado se você está progredindo, regredindo ou parado.\n\n",
                            style: corpo(),
                          ),
                        ],
                      ),
                      TextSpan(
                        text: "Estatísticas das fases\n",
                        style: topico(weight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text:
                                "Aqui fica a conclusão das suas pontuações nos exercícios, a partir da conclusão é informado se você está progredindo, regredindo ou parado.\n\n",
                            style: corpo(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Spacer(
          flex: 2,
        )
      ],
    );
  }
}
