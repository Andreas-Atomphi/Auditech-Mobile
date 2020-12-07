import 'package:flutter/material.dart';
import 'ListTileWelcome.dart';

class DrawerWelcome extends StatelessWidget {
  final List<Map<String, dynamic>> mapDados;
  final String nome;
  DrawerWelcome({
    this.mapDados,
    this.nome,
  });
  Widget build(BuildContext context) {
    return Drawer(
      child: Ink(
        color: Color.fromRGBO(0, 150, 140, 1),
        child: ListView(
          children: <Widget>[
            Container(
              height: 170,
              child: Stack(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Logo_02.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: null,
                  ),
                  Positioned(
                    left: 5,
                    bottom: 30,
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        radius: 45,
                        child: Text(
                          nome[0],
                          style: TextStyle(
                            fontSize: 45,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      margin: EdgeInsets.only(top: 60),
                    ),
                  ),
                  Positioned(
                    top: 135,
                    child: Text(
                      nome,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...mapDados
                .map(
                  (e) => ListTileWelcome(
                    e["texto"],
                    e["metodo"],
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
