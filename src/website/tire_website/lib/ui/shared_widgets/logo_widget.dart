import 'package:flutter/material.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/constants.dart';
import 'package:tire_website/utils/eums.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget();

  @override
  _LogoWidgetState createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      // width: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          SizedBox(
            height: 30,
            width: 40,
            child: CustomImageWidget(
              imageUrl: logoImagePng,
              imageWidgetType: ImageWidgetType.asset,
            ),
          ),
          SizedBox(width: 10.0),
          CustomText(
            text: 'CMART WHEELS',
            size: 25,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
