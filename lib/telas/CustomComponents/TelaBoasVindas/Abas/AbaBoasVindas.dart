import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class AbaBoasVindas extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 1,
        ),
        InstructAndGreetings(
            "Aqui teremos mensagens de boas-vindas e instruções iniciais"),
        Spacer(
          flex: 2,
        )
      ],
    );
  }
}
