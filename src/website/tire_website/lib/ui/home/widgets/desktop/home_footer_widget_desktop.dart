import 'package:flutter/material.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';

class HomeFooterWidgetDesktop extends StatelessWidget {
  const HomeFooterWidgetDesktop();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      height: 136.0,
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Spacer(),
              CustomText(
                text: 'About Us',
                color: Colors.white,
                size: 15.0,
              ),
              SizedBox(width: 15.0),
              CustomText(
                text: 'Categories',
                color: Colors.white,
                size: 15.0,
              ),
              SizedBox(width: 15.0),
              CustomText(
                text: 'FAQ',
                color: Colors.white,
                size: 15.0,
              ),
              SizedBox(width: 15.0),
              CustomText(
                text: 'Contacts',
                color: Colors.white,
                size: 15.0,
              ),
              Spacer(),
            ],
          ),
          const SizedBox(height: 40.0),
          const CustomText(
            text: 'Copyright 2021 \n Developed by Kod-X',
            color: Colors.white,
            size: 15.0,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
