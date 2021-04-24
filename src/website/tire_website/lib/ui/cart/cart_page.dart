import 'package:flutter/material.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/header_widget.dart';
import 'package:tire_website/ui/shared_widgets/side_menu.dart';

class CartPage extends StatelessWidget {
  const CartPage();
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        const HeaderWidget(),
        Row(
          children: const <Widget>[
            SideMenu(),
            Expanded(child: Center(child: CustomText(text: ' cart Page'))),
          ],
        ),
      ],
    );
  }
}
