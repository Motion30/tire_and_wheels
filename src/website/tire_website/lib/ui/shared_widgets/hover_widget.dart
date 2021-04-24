import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';

class CustomHover extends StatelessWidget {
  const CustomHover({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return HoverContainer(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      color: Colors.transparent,
      hoverColor: Colors.grey[300],
      child: Center(child: child),
    );
  }
}
