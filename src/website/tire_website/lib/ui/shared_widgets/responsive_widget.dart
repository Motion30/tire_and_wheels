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

    if (screenWidth < 900 && screenWidth > 600) {
      viewToDisplay = tabletView ?? const Center(child: Text('Tablet'));
    } else if (screenWidth <= 600) {
      viewToDisplay = mobileView ?? const Center(child: Text('Mobile'));
    } else {
      viewToDisplay = desktopView;
    }

    return viewToDisplay;
  }
}
