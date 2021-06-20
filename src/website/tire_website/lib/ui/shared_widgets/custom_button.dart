import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    @required this.onPress,
    @required this.title,
    this.textColor = Colors.white,
    this.outLine = false,
    this.fontSize = 20,
    this.radius = 5.0,
    this.fontWeight = FontWeight.bold,
    this.width,
    this.height,
    this.buttonColor,
  });

  final Function onPress;
  final double width;
  final double height;
  final double radius;
  final String title;
  final Color textColor;
  final Color buttonColor;
  final bool outLine;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        decoration: outLine
            ? BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(radius),
              )
            : BoxDecoration(
                color: buttonColor ?? Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(radius),
              ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
        width: width,
        height: height,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
