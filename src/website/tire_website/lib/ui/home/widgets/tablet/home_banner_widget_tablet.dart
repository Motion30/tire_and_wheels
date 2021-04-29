import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/hover_widget.dart';
import 'package:tire_website/utils/constant_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeBannerWidgetTablet extends StatelessWidget {
  const HomeBannerWidgetTablet();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // SvgPicture.asset(
        //   'assets/images/tyres_image.svg',
        //   matchTextDirection: true,
        // ),
        Image.asset(
          'assets/images/tyres_image.png',
          width: double.infinity,
          height: 400.0,
          fit: BoxFit.fill,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          width: double.infinity,
          height: 400.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            gradient: LinearGradient(
              colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.7),
                Colors.transparent,
              ],
              stops: const <double>[0.4, 0.7, 0.9],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.63,
                child: const CustomText(
                  text:
                      'We are your one stop shop for quality Tyres, Tubes and Rims',
                  size: ksTabletTextSizeExtraLarge - 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: const CustomText(
                  text:
                      'An all in one system that optimizes your products on your favourite selling platforms easily accessible, efficient and affordable.',
                  size: ksTabletTextSizeTiny + 2,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 25.0),
              CustomHover(
                color: Theme.of(context).accentColor,
                center: false,
                child: CustomButton(
                  width: 200.0,
                  radius: 50.0,
                  onPress: () {
                    VxNavigator.of(context)
                        .push(Uri.parse(RouteClass.productTyresPage));
                  },
                  fontWeight: FontWeight.w300,
                  fontSize: ksDesktopTextSizeSmall,
                  title: 'Get Started',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
