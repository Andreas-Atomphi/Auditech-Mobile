import 'package:flutter/material.dart';

class ScrollableCardColumn extends StatelessWidget {
  final List<Widget> children;
  final double width, height;
  final EdgeInsets  padding;

  ScrollableCardColumn({
    @required this.children,
    this.height = 100,
    this.width = 100,
    this.padding
  });

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        padding:  padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [...children],
          ),
        ),
      ),
    );
  }
}
