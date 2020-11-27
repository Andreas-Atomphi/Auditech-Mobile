import 'package:flutter/material.dart';

class Duracao extends StatefulWidget {
  final int duration;
  Duracao({this.duration = 0});

  @override
  _SDuracao createState() => new _SDuracao(duration);
}

class _SDuracao extends State<Duracao> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  final int _duration;

  _SDuracao(this._duration);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: _duration), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: animation.value,
      backgroundColor: Colors.blue,
      valueColor: AlwaysStoppedAnimation(Colors.orange),
      minHeight: 7,
    );
  }
}
