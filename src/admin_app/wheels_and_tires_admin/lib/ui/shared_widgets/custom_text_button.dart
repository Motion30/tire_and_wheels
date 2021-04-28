import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({@required this.child, @required this.callback});

  final Widget child;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => callback, child: child);
  }
}
