import 'package:flutter/material.dart';

class InstrucControll extends StatelessWidget {
  final Widget visor;
  final Color btnColors, bgColor, textColor;

  InstrucControll(this.visor, this.btnColors, this.bgColor, this.textColor);

  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          visor,
          /*Row(
            children: [
              Spacer(
                flex: 1,
              ),
              Container(
                child: RaisedButton(
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: textColor,
                  ),
                  color: btnColors,
                  onPressed: () {},
                  elevation: 0.0,
                ),
              ),
              Spacer(
                flex: 6,
              ),
              Container(
                child: RaisedButton(
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                  ),
                  color: corDeDestaque,
                  onPressed: () {},
                  elevation: 0.0,
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
