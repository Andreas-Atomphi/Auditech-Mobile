import 'package:AuditechMobile/telas/CustomComponents/Global/globalComponents.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class AbaBoasVindas extends StatelessWidget {
  Widget build(BuildContext context) {
    const title =
        TextStyle(color: Colors.black, fontSize: 40, fontFamily: "OpenSans");
    return Column(
      children: [
        Spacer(
          flex: 1,
        ),
        InstructAndGreetings(
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Bem-vindo!",
                  style: title,
                ),
              ],
            ),
          ),
        ),
        Spacer(
          flex: 2,
        )
      ],
    );
  }
}
