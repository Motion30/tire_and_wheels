import 'package:flutter/material.dart';
import 'package:tire_website/ui/home/contants.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/eums.dart';

class HomeWhyUsWidgetMobile extends StatelessWidget {
  const HomeWhyUsWidgetMobile();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        children: <Widget>[
          CustomText(
            text: 'Why Choose Us?',
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
            size: 24,
          ),
          const SizedBox(height: 66.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              item(
                context,
                'CONVENIENCE',
                'assets/images/con.png',
                convenienceText,
              ),
              item(
                context,
                'VAST SELECTION',
                'assets/images/van.png',
                vastText,
              ),
              item(
                context,
                'EARN REWARDS!',
                'assets/images/money_bag.png',
                earnText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget item(
      BuildContext context, String title, String imagePath, String subTitle) {
    return SizedBox(
      height: 300.0,
      width: MediaQuery.of(context).size.width * 0.60,
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
            size: 15.0,
            textAlign: TextAlign.center,
          ),
          CustomText(
            text: subTitle,
            fontWeight: FontWeight.w500,
            size: 11.0,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
