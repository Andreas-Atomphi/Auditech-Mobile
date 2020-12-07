import 'package:auditech_mobile/mainData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Telas.dart';

class _STelaSemConexao extends State<TelaSemConexao> {
  Widget _wait;

  void wait() {
    setState(() {
      _wait = Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: SpinKitRing(
          color: Colors.white,
          size: 50.0,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              width: tamanhoRelativoL(200, context),
              height: tamanhoRelativoL(200, context),
              child: Image.asset("assets/images/Logo_Transparent.png"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(0, 0, 0, 0.5),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              child: Text(
                "Você não está conectado à internet",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          Align(
              alignment: Alignment(0, 0.2),
              child: (_wait != null)
                  ? _wait
                  : FlatButton(
                      color: Theme.of(context).buttonColor,
                      onPressed: () {
                        wait();

                        conectado.then(
                          (value) {
                            if (value) {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: routes["principal"]),
                              );
                            } else {
                              setState(() {
                                _wait = null;
                              });
                            }
                          },
                        );
                      },
                      child: Text(
                        "Tentar de novo",
                      ),
                    )),
        ],
      ),
    );
  }
}

class TelaSemConexao extends StatefulWidget {
  State<TelaSemConexao> createState() => _STelaSemConexao();
}
