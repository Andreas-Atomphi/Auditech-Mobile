import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class AbaBoasVindas extends StatelessWidget {
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
        Spacer(flex:  1),

          ScrollableCardColumn(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.6,
            padding: EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Bem-vindo!\n\n\n",
                      style: FormatoTexto.title(weight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          "Olá, bem-vindo ao Auditech, o seu app de tratamento ao DPAC, Segue abaixo as instruções de como usar o app\n\n",
                      style: FormatoTexto.corpo(),
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
                      style: FormatoTexto.subtitulo(weight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text:
                              "Nessa aba fica registrado sua pontuação, e te informa se você está progredindo, regredindo ou parado. Esta aba é dividida em duas seções, sendo:\n\n",
                          style: FormatoTexto.corpo(),
                        ),
                        TextSpan(
                          text: "Estatística global\n",
                          style: FormatoTexto.topico(weight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  "Aqui fica a conclusão das suas pontuações nos exercícios, a partir da conclusão é informado se você está progredindo, regredindo ou parado.\n\n",
                              style: FormatoTexto.corpo(),
                            ),
                          ],
                        ),
                        TextSpan(
                          text: "Estatísticas das fases\n",
                          style: FormatoTexto.topico(weight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  "Aqui fica a conclusão das suas pontuações nos exercícios, a partir da conclusão é informado se você está progredindo, regredindo ou parado.\n\n",
                              style: FormatoTexto.corpo(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    TextSpan(
                      text: "Treinamentos\n",
                      style: FormatoTexto.subtitulo(weight: FontWeight.bold),
                      children: [
                        WidgetSpan(
                          child: SizedBox(
                            child: Text(
                              "Nessa aba ficam seus treinos, você poderá acessar apenas os que estiverem liberados para você, quem libera é o seu clínico apenas depois de ver que você está em progresso, então... mãos na massa.\n",
                              style: FormatoTexto.corpo(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(flex:  2),
        ],
      );
  }
}
