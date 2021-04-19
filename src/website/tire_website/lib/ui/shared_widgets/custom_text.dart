import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    @required this.text,
    this.size,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.justify,
    this.maxLine,
    this.letterSpacing = 1.0,
    this.wordSpacing = 1.0,
  });

  final String text;
  final double size;
  final double letterSpacing;
  final double wordSpacing;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return maxLine != null
        ? Text(
            text,
            style: TextStyle(
              fontSize: size,
              color: color,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
            ),
            textAlign: textAlign,
            maxLines: maxLine,
            overflow: TextOverflow.ellipsis,
          )
        : Text(
            text,
            style: TextStyle(
              fontSize: size,
              color: color,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              wordSpacing: wordSpacing,
            ),
            textAlign: textAlign,
          );
  }
}
