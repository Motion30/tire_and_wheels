import 'package:flutter/material.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/eums.dart';

class HomeWhyUsWidgetTablet extends StatelessWidget {
  const HomeWhyUsWidgetTablet();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          CustomText(
            text: 'Why Choose Us?',
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
            size: 24,
          ),
          const SizedBox(height: 66.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              item(
                'Order a product with ease',
                'assets/images/corona.png',
                'Get to products to more people and watch your products sell faster',
              ),
              item(
                'Get quality products at affordable prices',
                'assets/images/money_bag.png',
                'Get to products to more people and watch your products sell faster',
              ),
              item(
                'Dedicated Support',
                'assets/images/chat.png',
                'Get to products to more people and watch your products sell faster',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget item(String title, String imagePath, String subTitle) {
    return SizedBox(
      height: 300.0,
      width: 190.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: 161.0,
            width: 165.0,
            child: CustomImageWidget(
              imageWidgetType: ImageWidgetType.asset,
              imageUrl: imagePath,
            ),
          ),
          CustomText(
            text: title,
            fontWeight: FontWeight.w600,
            size: 17.0,
            textAlign: TextAlign.center,
          ),
          CustomText(
            text: subTitle,
            fontWeight: FontWeight.w500,
            size: 12.0,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
