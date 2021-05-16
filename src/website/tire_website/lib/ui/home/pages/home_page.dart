import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
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
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/custom_text_button.dart';
import 'package:tire_website/ui/shared_widgets/hover_widget.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';
import 'package:tire_website/utils/custom_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomResponsiveWidget(
        desktopView: HomeDesktop(),
        tabletView: HomeTablet(),
        mobileView: HomeMobile(),
      ),
    );
  }
}

class HomeDesktop extends StatelessWidget {
  const HomeDesktop();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
    );
  }
}

class HomeTablet extends StatelessWidget {
  const HomeTablet();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      widget: Scrollbar(
        isAlwaysShown: true,
        child: Slider(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              CustomResponsiveWidget(
                desktopView: const HomePageHeaderDesktop(),
                tabletView: Container(),
                mobileView: Container(),
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

class HomeMobile extends StatelessWidget {
  const HomeMobile();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      widget: Scrollbar(
        isAlwaysShown: true,
        child: Slider(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              CustomResponsiveWidget(
                desktopView: const HomePageHeaderDesktop(),
                tabletView: HomePageHeaderTablet(),
                mobileView: Container(),
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

class Slider extends StatelessWidget {
  const Slider({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliderMenuContainer(
      appBarColor: Theme.of(context).primaryColor,
      drawerIconColor: Colors.white,
      // key: _key,
      sliderMenuOpenSize: 200,
      title: const CustomText(
        text: 'Tyres and wheels',
        color: Colors.white,
        size: 22.0,
      ),
      sliderMenu: const SiderWidget(),
      sliderMain: Container(
        width: double.infinity,
        color: Colors.white,
        child: child,
      ),
    );
  }
}

class SiderWidget extends StatelessWidget {
  const SiderWidget();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(height: 15.0),
        CustomTextButton(
          callback: () {},
          child: CustomHover(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            child: const CustomText(
              text: 'Home',
              size: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        CustomTextButton(
          callback: () {
            VxNavigator.of(context)
                .push(Uri.parse(RouteClass.productTyresPage));
          },
          child: CustomHover(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            child: const CustomText(
              text: 'Categories',
              size: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        CustomTextButton(
          callback: () {
            // VxNavigator.of(context)
            //     .push(Uri.parse(RouteClass.productTyresPage));
          },
          child: CustomHover(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            child: const CustomText(
              text: 'About',
              size: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        CustomTextButton(
          callback: () {
            // VxNavigator.of(context)
            //     .push(Uri.parse(RouteClass.productTyresPage));
          },
          child: CustomHover(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            child: const CustomText(
              text: 'Contact Us',
              size: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(height: 40.0),
        CustomTextButton(
          callback: () {
            VxNavigator.of(context).push(Uri.parse(RouteClass.authPage));
          },
          child: CustomHover(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            color: Theme.of(context).accentColor.withOpacity(0.8),
            child: const CustomText(
              text: 'Login',
              size: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        CustomTextButton(
          callback: () {
            VxNavigator.of(context).push(Uri.parse(RouteClass.authPage));
          },
          child: CustomHover(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            color: Theme.of(context).accentColor.withOpacity(0.8),
            child: const CustomText(
              text: 'Sign up',
              size: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(width: 5.0),
      ],
    );
  }
}
