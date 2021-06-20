import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/business_logic/auth/repo/authentication_repo.dart';
import 'package:tire_website/business_logic/auth/repo/product_repo.dart';
import 'package:tire_website/ui/shared_widgets/custom_dialog.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/logo_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
            const LogoWidget(),
            if (showCart)
              StreamBuilder<DocumentSnapshot>(
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
                        if (AuthenticationRepo().auth.currentUser != null) {
                          VxNavigator.of(context)
                              .push(Uri.parse(RouteClass.cartPage));
                        } else {
                          CustomWarningDialog.showSnackBar(
                            context: context,
                            message: 'Login Or Sign up',
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    );
                  })
            else
              Container(),
          ],
        ),
      ),
    );
  }
}
