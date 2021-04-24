import 'package:flutter/material.dart';
import 'package:tire_website/ui/product/widget/desktop/tube_widget_desktop.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';

class TubesPage extends StatelessWidget {
  const TubesPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: CustomResponsiveWidget(
        desktopView: ProductWidgetDesktop(),
      ),
    );
  }
}
