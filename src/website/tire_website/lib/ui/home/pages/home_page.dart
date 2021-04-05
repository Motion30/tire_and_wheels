import 'package:flutter/material.dart';
import 'package:tire_website/ui/home/widgets/desktop/home_page_header_destop.dart';
import 'package:tire_website/ui/home/widgets/mobile/home_page_header_mobile.dart';
import 'package:tire_website/ui/home/widgets/tablet/home_page_header_tablet.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';
import 'package:tire_website/utils/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffold(
        widget: ListView(
          shrinkWrap: true,
          children: const <Widget>[
            CustomResponsiveWidget(
              desktopView: HomePageHeaderDesktop(),
              tabletView: HomePageHeaderTablet(),
              mobileView: HomePageHeaderMobile(),
            ),
          ],
        ),
      ),
    );
  }
}
