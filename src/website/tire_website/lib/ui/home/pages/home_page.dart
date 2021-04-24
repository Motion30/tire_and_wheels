import 'package:flutter/material.dart';
import 'package:tire_website/ui/home/widgets/desktop/home_banner_widget_desktop.dart';
import 'package:tire_website/ui/home/widgets/desktop/home_categories_widget_desktop.dart';
import 'package:tire_website/ui/home/widgets/desktop/home_footer_widget_desktop.dart';
import 'package:tire_website/ui/home/widgets/desktop/home_page_header_destop.dart';
import 'package:tire_website/ui/home/widgets/desktop/home_recommendation_widget_desktop.dart';
import 'package:tire_website/ui/home/widgets/desktop/why_us_widget_desktop.dart';
import 'package:tire_website/ui/home/widgets/mobile/home_banner_widget_moblie.dart';
import 'package:tire_website/ui/home/widgets/mobile/home_categories_widget_mobile.dart';
import 'package:tire_website/ui/home/widgets/mobile/home_footer_widget_mobile.dart';
import 'package:tire_website/ui/home/widgets/mobile/home_page_header_mobile.dart';
import 'package:tire_website/ui/home/widgets/mobile/home_recommendation_widget_mobile.dart';
import 'package:tire_website/ui/home/widgets/mobile/why_us_widget_mobile.dart';
import 'package:tire_website/ui/home/widgets/tablet/home_banner_widget_tablet.dart';
import 'package:tire_website/ui/home/widgets/tablet/home_categories_widget_tablet.dart';
import 'package:tire_website/ui/home/widgets/tablet/home_footer_widget_tablet.dart';
import 'package:tire_website/ui/home/widgets/tablet/home_page_header_tablet.dart';
import 'package:tire_website/ui/home/widgets/tablet/home_recommendation_widget_tablet.dart';
import 'package:tire_website/ui/home/widgets/tablet/why_us_widget_tablet.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';
import 'package:tire_website/utils/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffold(
        widget: Scrollbar(
          isAlwaysShown: true,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              CustomResponsiveWidget(
                desktopView: const HomePageHeaderDesktop(),
                tabletView: HomePageHeaderTablet(),
                mobileView: const HomePageHeaderMobile(),
              ),
              const CustomResponsiveWidget(
                desktopView: HomePageBannerWidgetDesktop(),
                tabletView: HomeBannerWidgetTablet(),
                mobileView: HomeBannerWidgetMobile(),
              ),
              const CustomResponsiveWidget(
                desktopView: HomeCategoriesWidgetDesktop(),
                tabletView: HomeCategoriesWidgetTablet(),
                mobileView: HomeCategoriesWidgetMobile(),
              ),
              const CustomResponsiveWidget(
                desktopView: HomeWhyUsWidgetDesktop(),
                tabletView: HomeWhyUsWidgetTablet(),
                mobileView: HomeWhyUsWidgetMobile(),
              ),
              const CustomResponsiveWidget(
                desktopView: HomeRecommendationWidgetDesktop(),
                tabletView: HomeRecommendationWidgetTablet(),
                mobileView: HomeRecommendationWidgetMobile(),
              ),
              const CustomResponsiveWidget(
                desktopView: HomeFooterWidgetDesktop(),
                tabletView: HomeFooterWidgetTablet(),
                mobileView: HomeFooterWidgetMobile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
