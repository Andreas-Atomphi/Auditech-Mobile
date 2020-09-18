import 'package:flutter/material.dart';

class ScrollableCardColumn extends StatelessWidget {
  final List<Widget> children;
  final double width, height;

  ScrollableCardColumn({
    @required this.children,
    this.height = 100,
    this.width = 100,
  });

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SingleChildScrollView(
        child: Card(
          child: Column(children: (children != null) ? children : null),
        ),
      ),
    );
  }
}
