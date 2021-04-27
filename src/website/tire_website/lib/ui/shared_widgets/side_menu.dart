import 'package:flutter/material.dart';
import 'package:tire_website/ui/order/orders_page.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';

import 'hover_widget.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({this.fontSize});

  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50.0),
              Column(
                children: const <Widget>[
                  CustomText(
                    text: 'Welcome',
                    size: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: 'User Name',
                    size: 16.0,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Icon(Icons.store_mall_directory_outlined),
                      CustomText(
                        text: 'Products',
                        size: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Tyres',
                      size: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Products',
                      size: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Rims',
                      size: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              CustomHover(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Widget>(
                            builder: (BuildContext context) =>
                                const OrdersPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Icon(Icons.shopping_basket_outlined),
                          const CustomText(
                            text: 'Orders',
                            size: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              CustomHover(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Icon(Icons.exit_to_app_outlined),
                          const CustomText(
                            text: 'Log Out',
                            size: 22.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SideMenuTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50.0),
              Column(
                children: const <Widget>[
                  CustomText(
                    text: 'Welcome',
                    size: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: 'User Name',
                    size: 14.0,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Icon(Icons.store_mall_directory_outlined),
                      CustomText(
                        text: 'Products',
                        size: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Tyres',
                      size: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Products',
                      size: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Rims',
                      size: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              CustomHover(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Widget>(
                            builder: (BuildContext context) =>
                                const OrdersPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Icon(Icons.shopping_basket_outlined),
                          const CustomText(
                            text: 'Orders',
                            size: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              CustomHover(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Icon(Icons.exit_to_app_outlined),
                          const CustomText(
                            text: 'Log Out',
                            size: 20.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SideMenuMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5.0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50.0),
              Column(
                children: const <Widget>[
                  CustomText(
                    text: 'Welcome',
                    size: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: 'User Name',
                    size: 14.0,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  const SizedBox(height: 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Icon(Icons.store_mall_directory_outlined),
                      CustomText(
                        text: 'Products',
                        size: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Tyres',
                      size: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Products',
                      size: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const CustomHover(
                    child: CustomText(
                      text: 'Rims',
                      size: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              CustomHover(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute<Widget>(
                            builder: (BuildContext context) =>
                                const OrdersPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Icon(Icons.shopping_basket_outlined),
                          const CustomText(
                            text: 'Orders',
                            size: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              CustomHover(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          const Icon(Icons.exit_to_app_outlined),
                          const CustomText(
                            text: 'Log Out',
                            size: 20.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
