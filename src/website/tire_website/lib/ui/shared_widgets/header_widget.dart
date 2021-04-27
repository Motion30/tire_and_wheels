import 'package:flutter/material.dart';
import 'package:tire_website/ui/cart/cart_page.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {this.fontSize, this.showCart = true, this.showMenu = true});

  final double fontSize;
  final bool showCart;
  final bool showMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 80,
      width: double.infinity,
      color: const Color.fromRGBO(2, 8, 144, 1),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(2, 8, 144, 1),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: Placeholder(color: Colors.white),
                ),
                const SizedBox(width: 20.0),
                CustomText(
                  text: 'Tyres and wheels',
                  color: Colors.white,
                  size: fontSize ?? 36.0,
                ),
              ],
            ),
            if (showCart)
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<Widget>(
                      builder: (BuildContext context) => const CartPage()));
                },
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
