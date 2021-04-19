import 'package:flutter/material.dart';
import 'package:tire_website/ui/home/widgets/shared_widget/home_page_search_bar.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/constant_helper.dart';

class HomePageHeaderMobile extends StatelessWidget {
  const HomePageHeaderMobile();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Scaffold(
        appBar: appBar(),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const CustomText(
        text: '      Tyres and wheels',
        size: ksMobileTextSizeMedium,
        color: Colors.white,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: const HomePageSearchBar(),
        ),
      ),
    );
  }
}
