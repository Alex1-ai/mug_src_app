import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color color;
  final String text;
  double size;
  double height;

  SmallText({
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 15,
    // height gives you space between the lines
    // of a word
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: size, fontFamily: "Roboto", height: height),
    );
  }
}
