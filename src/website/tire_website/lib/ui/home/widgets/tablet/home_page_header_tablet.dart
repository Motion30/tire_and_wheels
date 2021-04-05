import 'package:flutter/material.dart';
import 'package:tire_website/ui/home/widgets/shared_widget/home_page_search_bar.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/constant_helper.dart';

class HomePageHeaderTablet extends StatelessWidget {
  const HomePageHeaderTablet();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            text: 'Tyres and wheels',
            size: ksTabletTextSizeMedium,
            color: Colors.white,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: const HomePageSearchBar(),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {},
                title: const CustomText(
                  text: 'Home',
                  size: ksTabletTextSizeSmall,
                ),
                trailing: const Icon(Icons.home_outlined),
              ),
              ListTile(
                onTap: () {},
                title: const CustomText(
                  text: 'Categories',
                  size: ksTabletTextSizeSmall,
                ),
                trailing: const Icon(Icons.shopping_cart_outlined),
              ),
              ListTile(
                onTap: () {},
                title: const CustomText(
                  text: 'About',
                  size: ksTabletTextSizeSmall,
                ),
                trailing: const Icon(Icons.info_outline_rounded),
              ),
              ListTile(
                onTap: () {},
                title: const CustomText(
                  text: 'Contact Us',
                  size: ksTabletTextSizeSmall,
                ),
                trailing: const Icon(Icons.contact_mail_outlined),
              ),
              ListTile(
                onTap: () {},
                title: const CustomText(
                  text: 'Login',
                  size: ksTabletTextSizeSmall,
                ),
              ),
              ListTile(
                onTap: () {},
                title: const CustomText(
                  text: 'Sign Up',
                  size: ksTabletTextSizeSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
