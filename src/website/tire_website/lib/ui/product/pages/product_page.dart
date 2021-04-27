import 'package:flutter/material.dart';
import 'package:tire_website/ui/product/widget/desktop/product_widget_desktop.dart';
import 'package:tire_website/ui/product/widget/mobile/product_page_mobile.dart';
import 'package:tire_website/ui/product/widget/tablet/product_widget_tablet.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: CustomResponsiveWidget(
        desktopView: ProductWidgetDesktop(type: type),
        tabletView: ProductWidgetTablet(type: type),
        mobileView: ProductWidgetMobile(type: type),
      ),
    );
  }
}
