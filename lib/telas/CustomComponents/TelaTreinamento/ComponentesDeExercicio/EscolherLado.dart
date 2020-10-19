import 'package:AuditechMobile/telas/CustomComponents/TelaTreinamento/components.dart';
import 'package:flutter/material.dart';

class EscolherLado extends Container {
  final dynamic Function() aoPressionarE, aoPressionarD;
  EscolherLado({this.aoPressionarE, this.aoPressionarD, Widget aviso})
      : super(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          child: Column(
            children: [
              Spacer(flex: 3),
              aviso,
              Spacer(flex: 2),
              Row(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  SideButton(
                    "Esquerda",
                    aoPressionarE,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  SideButton(
                    "Direita",
                    aoPressionarD,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                ],
              ),
              Spacer(flex: 1),
            ],
          ),
        );
}
