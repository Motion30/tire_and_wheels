import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/business_logic/auth/repo/product_repo.dart';
import 'package:tire_website/ui/cart/cart_page.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';
import 'package:tire_website/ui/shared_widgets/side_menu.dart';
import 'package:velocity_x/velocity_x.dart';

import 'custom_text.dart';
import 'header_widget.dart';

class CustomHeaderAndSideMenuWidget extends StatelessWidget {
  const CustomHeaderAndSideMenuWidget({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveWidget(
      desktopView: desktop(context),
      tabletView: tablet(context),
      mobileView: mobile(context),
    );
  }

  Widget desktop(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          const HeaderWidget(),
          Row(
            children: <Widget>[
              const SideMenu(),
              child,
            ],
          ),
        ],
      ),
    );
  }

  Widget tablet(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          const HeaderWidget(fontSize: 20.0),
          Row(
            children: <Widget>[
              SideMenuTablet(),
              child,
            ],
          ),
        ],
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return Material(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SliderMenuContainer(
          appBarColor: Theme.of(context).primaryColor,
          drawerIconColor: Colors.white,
          // key: _key,
          sliderMenuOpenSize: 200,
          title: const CustomText(
            text: 'Tyres and wheels',
            color: Colors.white,
            size: 22.0,
          ),
          trailing: StreamBuilder<DocumentSnapshot>(
              stream: ProductRepo().cartStream(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.data != null) {
                  final ProductModel product = ProductModel.fromMap(
                    snapshot.data.data(),
                  );
                  return Stack(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          VxNavigator.of(context)
                              .push(Uri.parse(RouteClass.cartPage));
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: Center(
                          child: CustomText(
                            text: '${product.cartCount}',
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                            size: 10.0,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute<Widget>(
                        builder: (BuildContext context) =>
                        const CartPage()));
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                );
              }),
          sliderMenu: SideMenuMobile(),
          sliderMain: Container(
            width: double.infinity,
            color: Colors.white,
            child: child,

          ),
        ),
      ),
    );
  }
}
