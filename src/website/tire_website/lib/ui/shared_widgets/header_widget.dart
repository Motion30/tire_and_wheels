import 'package:flutter/material.dart';
import 'package:tire_website/ui/cart/cart_page.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget();

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
              children: const <Widget>[
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Placeholder(color: Colors.white),
                ),
                SizedBox(width: 20.0),
                CustomText(
                  text: 'Tyres and wheels',
                  color: Colors.white,
                  size: 36.0,
                ),
              ],
            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
