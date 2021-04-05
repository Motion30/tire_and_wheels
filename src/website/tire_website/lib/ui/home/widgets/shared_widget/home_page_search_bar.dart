import 'package:flutter/material.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/constant_helper.dart';

class HomePageSearchBar extends StatelessWidget {
  const HomePageSearchBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      height: 37.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * 0.55,
            height: 37.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const CustomText(
              text: 'Search for products...',
              size: ksDesktopTextSizeTiny,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              width: 50.0,
              height: 37.0,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
