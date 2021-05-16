import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/ui/home/widgets/shared_widget/home_page_search_bar.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/custom_text_button.dart';
import 'package:tire_website/ui/shared_widgets/hover_widget.dart';
import 'package:tire_website/utils/constant_helper.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageHeaderDesktop extends StatelessWidget {
  const HomePageHeaderDesktop();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(height: 25.0, width: 25.0, child: Placeholder()),
              const SizedBox(width: 10.0),
              const CustomText(
                text: 'Tyres and wheels',
                size: ksDesktopTextSizeSmall,
                color: Colors.white,
              ),
              const Spacer(),

              ///

              CustomHover(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10.0,
                ),
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                child: CustomTextButton(
                  callback: () {
                    VxNavigator.of(context).push(Uri.parse(RouteClass.home));
                  },
                  child: const CustomText(
                    text: 'HOME',
                    color: Colors.white,
                    size: ksDesktopTextSizeTiny,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              CustomHover(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10.0,
                ),
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                child: CustomTextButton(
                  callback: () {
                    VxNavigator.of(context)
                        .push(Uri.parse(RouteClass.productTyresPage));
                  },
                  child: const CustomText(
                    text: 'CATEGORIES',
                    color: Colors.white,
                    size: ksDesktopTextSizeTiny,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              CustomHover(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                child: CustomTextButton(
                  callback: () {},
                  child: const CustomText(
                    text: 'ABOUT',
                    color: Colors.white,
                    size: ksDesktopTextSizeTiny,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              CustomHover(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10.0,
                ),
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                child: CustomTextButton(
                  callback: () {},
                  child: const CustomText(
                    text: 'CONTACT US',
                    color: Colors.white,
                    size: ksDesktopTextSizeTiny,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(width: 5.0),

              ///
              const SizedBox(width: 5.0),
              CustomHover(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10.0,
                ),
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                child: CustomButton(
                  onPress: () {
                    VxNavigator.of(context)
                        .push(Uri.parse(RouteClass.authPage));
                  },
                  title: 'Login',
                  outLine: true,
                  fontWeight: FontWeight.w300,
                  fontSize: ksDesktopTextSizeTiny,
                ),
              ),
              const SizedBox(width: 5.0),
              CustomHover(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10.0,
                ),
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                child: CustomButton(
                  onPress: () {
                    VxNavigator.of(context)
                        .push(Uri.parse(RouteClass.signUpPage));
                  },
                  title: 'Sign Up',
                  fontWeight: FontWeight.w300,
                  fontSize: ksDesktopTextSizeTiny,
                ),
              ),
            ],
          ),

          ///
          const SizedBox(height: 5.0),
          const HomePageSearchBar(),
        ],
      ),
    );
  }
}
