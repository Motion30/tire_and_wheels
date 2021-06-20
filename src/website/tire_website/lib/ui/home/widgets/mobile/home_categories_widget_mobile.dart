import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/eums.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeCategoriesWidgetMobile extends StatelessWidget {
  const HomeCategoriesWidgetMobile();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
      child: Column(
        children: <Widget>[
          CustomText(
            text: 'Categories',
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
            size: 22,
          ),
          const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              categoriesItem(
                context,
                'Tyres',
                'assets/images/tyres.png',
                color: const Color.fromRGBO(15, 0, 193, 0.8),
              ),
              const SizedBox(height: 20.0),
              categoriesItem(
                context,
                'Tubes',
                'assets/images/tubes.png',
                color: const Color.fromRGBO(119, 55, 255, 1),
              ),
              const SizedBox(height: 20.0),
              categoriesItem(
                context,
                'Rims',
                'assets/images/rims.png',
                color: const Color.fromRGBO(255, 129, 38, 1),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ],
      ),
    );
  }

  Widget categoriesItem(BuildContext context, String title, String imagePath,
      {Color color}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 5.0,
          width: MediaQuery.of(context).size.width * 0.30,
          decoration: BoxDecoration(
            color: color ?? Colors.blue,
            border: Border.all(color: color ?? Colors.blue),
          ),
        ),
        Container(
          height: 220.0,
          width: MediaQuery.of(context).size.width * 0.30,
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
                size: 20,
              ),
              SizedBox(
                height: 90.0,
                width: MediaQuery.of(context).size.width * 0.25,
                child: CustomImageWidget(
                  imageWidgetType: ImageWidgetType.asset,
                  imageUrl: imagePath,
                ),
              ),
              SizedBox(
                height: 40.0,
                width: MediaQuery.of(context).size.width * 0.20,
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
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
