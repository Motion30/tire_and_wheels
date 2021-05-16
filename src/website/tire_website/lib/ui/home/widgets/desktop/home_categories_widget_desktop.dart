import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/hover_widget.dart';
import 'package:tire_website/utils/eums.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeCategoriesWidgetDesktop extends StatelessWidget {
  const HomeCategoriesWidgetDesktop();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
      child: Column(
        children: <Widget>[
          CustomText(
            text: 'Categories',
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
            size: 30,
          ),
          const SizedBox(height: 66.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              categoriesItem(
                'Tyres',
                'assets/images/tyres.png',
                color: const Color.fromRGBO(15, 0, 193, 0.8),
                context: context,
              ),
              categoriesItem(
                'Tubes',
                'assets/images/tubes.png',
                color: const Color.fromRGBO(119, 55, 255, 1),
                context: context,
              ),
              
              categoriesItem(
                'Rims',
                'assets/images/rims.png',
                color: const Color.fromRGBO(255, 129, 38, 1),
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoriesItem(String title, String imagePath,
      {Color color, BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 5.0,
          width: 225.0,
          decoration: BoxDecoration(
            color: color ?? Colors.blue,
            border: Border.all(color: color ?? Colors.blue),
          ),
        ),
        Container(
          height: 343.0,
          width: 225.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: color ?? Colors.blue),
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomText(
                text: title,
                fontWeight: FontWeight.w700,
                color: color ?? Colors.blue,
                size: 24,
              ),
              SizedBox(
                height: 161.0,
                width: 165.0,
                child: CustomImageWidget(
                  imageWidgetType: ImageWidgetType.asset,
                  imageUrl: imagePath,
                ),
              ),
              SizedBox(
                height: 48.0,
                width: 128.0,
                child: CustomHover(
                  color: Theme.of(context).accentColor,
                  center: false,
                  child: CustomButton(
                    onPress: () {
                      if (title.toLowerCase() == 'tubes') {
                        VxNavigator.of(context)
                            .push(Uri.parse(RouteClass.productTubePage));
                      } else if (title.toLowerCase() == 'tyres') {
                        VxNavigator.of(context)
                            .push(Uri.parse(RouteClass.productTyresPage));
                      } else if (title.toLowerCase() == 'rims') {
                        VxNavigator.of(context)
                            .push(Uri.parse(RouteClass.productRimPage));
                      }
                    },
                    title: 'Check Out',
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
