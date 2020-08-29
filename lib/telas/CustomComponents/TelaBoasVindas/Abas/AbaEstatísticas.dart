import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class AbaEstatisticas extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 1,
        ),
        InstructAndGreetings(
            "Aqui será mostrado as estatísticas do Usuário (se está progredindo, regredindo ou estagnado)."),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
