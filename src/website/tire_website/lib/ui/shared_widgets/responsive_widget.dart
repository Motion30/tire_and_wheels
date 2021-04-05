import 'package:flutter/material.dart';

class CustomResponsiveWidget extends StatelessWidget {
  const CustomResponsiveWidget(
      {@required this.desktopView, this.tabletView, this.mobileView});

  final Widget desktopView;
  final Widget tabletView;
  final Widget mobileView;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    Widget viewToDisplay;

    print(screenWidth);

    if (screenWidth < 900 && screenWidth > 500) {
      viewToDisplay = tabletView;
    } else if (screenWidth <= 500) {
      viewToDisplay = mobileView;
    } else {
      viewToDisplay = desktopView;
    }

    return viewToDisplay;
  }
}
