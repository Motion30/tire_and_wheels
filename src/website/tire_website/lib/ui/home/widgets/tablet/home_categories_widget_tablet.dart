import 'package:flutter/material.dart';
import 'package:tire_website/ui/product/pages/rims_page.dart';
import 'package:tire_website/ui/product/pages/tubes_page.dart';
import 'package:tire_website/ui/product/pages/tyres_page.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/eums.dart';

class HomeCategoriesWidgetTablet extends StatelessWidget {
  const HomeCategoriesWidgetTablet();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          CustomText(
            text: 'Categories',
            fontWeight: FontWeight.w600,
            color: Theme.of(context).accentColor,
            size: 24,
          ),
          const SizedBox(height: 55.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              categoriesItem(
                'Tubes',
                'assets/images/tubes.png',
                color: const Color.fromRGBO(119, 55, 255, 1),
                context: context,
              ),
              categoriesItem(
                'Tyres',
                'assets/images/tyres.png',
                color: const Color.fromRGBO(15, 0, 193, 0.8),
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

  Widget categoriesItem(String title, String imagePath, {Color color, BuildContext context}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 5.0,
          width: 190.0,
          decoration: BoxDecoration(
            color: color ?? Colors.blue,
            border: Border.all(color: color ?? Colors.blue),
          ),
        ),
        Container(
          height: 300.0,
          width: 190.0,
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
                height: 140.0,
                width: 145.0,
                child: CustomImageWidget(
                  imageWidgetType: ImageWidgetType.asset,
                  imageUrl: imagePath,
                ),
              ),
              SizedBox(
                height: 30.0,
                width: 100.0,
                child: CustomButton(
                  onPress: () {
                    if (title.toLowerCase() == 'tubes') {
                      Navigator.of(context).push(
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => const TubesPage(),
                        ),
                      );
                    } else if (title.toLowerCase() == 'tyres') {
                      Navigator.of(context).push(
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => const TyresPage(),
                        ),
                      );
                    } else if (title.toLowerCase() == 'rims') {
                      Navigator.of(context).push(
                        MaterialPageRoute<Widget>(
                          builder: (BuildContext context) => const RimsPage(),
                        ),
                      );
                    }
                  },
                  title: 'Check Out',
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
