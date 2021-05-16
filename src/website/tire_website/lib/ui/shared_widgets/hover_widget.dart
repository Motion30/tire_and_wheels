import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class CustomHover extends StatelessWidget {
  const CustomHover({this.child, this.color, this.center = true, this.padding});

  final Widget child;
  final Color color;
  final bool center;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return HoverContainer(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
      color: Colors.transparent,
      hoverColor: color ?? Colors.grey[300],
      child: center ? Center(child: child) : child,
    );
  }
}
