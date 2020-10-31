import 'package:flutter/material.dart';
import 'ListTileWelcome.dart';

class DrawerWelcome extends StatelessWidget {
  final List<Map<String, dynamic>> mapDados;
  DrawerWelcome({this.mapDados});
  Widget build(BuildContext context) {
    return Drawer(
      child: Ink(
        color: Color.fromRGBO(0, 150, 140, 1),
        child: ListView(
          children: <Widget>[
            Stack(
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
                        "U",
                        style: TextStyle(
                          fontSize: 45,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 60),
                  ),
                )
              ],
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
