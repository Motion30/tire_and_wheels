import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/utils/constant_helper.dart';

class HomePageHeaderTablet extends StatelessWidget {
  HomePageHeaderTablet();

  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SliderMenuContainer(
        appBarColor: Theme.of(context).primaryColor,
        key: _key,
        sliderMenuOpenSize: 200,
        title: const CustomText(
          text: 'Tyres and wheels',
          size: ksTabletTextSizeMedium,
          color: Colors.white,
        ),
        sliderMenu: ListView(
          shrinkWrap: true,
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
        sliderMain: Container(),
      ),
    );
    // return SizedBox(
    //   height: 200.0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const CustomText(
    //         text: 'Tyres and wheels',
    //         size: ksTabletTextSizeMedium,
    //         color: Colors.white,
    //       ),
    //       bottom: PreferredSize(
    //         preferredSize: const Size.fromHeight(40.0),
    //         child: Container(
    //           margin: const EdgeInsets.symmetric(vertical: 10.0),
    //           child: const HomePageSearchBar(),
    //         ),
    //       ),
    //     ),
    //     drawer: Drawer(
    //       child: ListView(
    //         children: <Widget>[
    //           ListTile(
    //             onTap: () {},
    //             title: const CustomText(
    //               text: 'Home',
    //               size: ksTabletTextSizeSmall,
    //             ),
    //             trailing: const Icon(Icons.home_outlined),
    //           ),
    //           ListTile(
    //             onTap: () {},
    //             title: const CustomText(
    //               text: 'Categories',
    //               size: ksTabletTextSizeSmall,
    //             ),
    //             trailing: const Icon(Icons.shopping_cart_outlined),
    //           ),
    //           ListTile(
    //             onTap: () {},
    //             title: const CustomText(
    //               text: 'About',
    //               size: ksTabletTextSizeSmall,
    //             ),
    //             trailing: const Icon(Icons.info_outline_rounded),
    //           ),
    //           ListTile(
    //             onTap: () {},
    //             title: const CustomText(
    //               text: 'Contact Us',
    //               size: ksTabletTextSizeSmall,
    //             ),
    //             trailing: const Icon(Icons.contact_mail_outlined),
    //           ),
    //           ListTile(
    //             onTap: () {},
    //             title: const CustomText(
    //               text: 'Login',
    //               size: ksTabletTextSizeSmall,
    //             ),
    //           ),
    //           ListTile(
    //             onTap: () {},
    //             title: const CustomText(
    //               text: 'Sign Up',
    //               size: ksTabletTextSizeSmall,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
