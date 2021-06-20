import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:tire_website/business_logic/auth/bloc/product_bloc.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/business_logic/auth/model/route.dart';
import 'package:tire_website/business_logic/auth/repo/authentication_repo.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_dialog.dart';
import 'package:tire_website/ui/shared_widgets/custom_header_sidemenu_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/responsive_widget.dart';
import 'package:tire_website/utils/eums.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage();

  @override
  Widget build(BuildContext context) {
    return CustomHeaderAndSideMenuWidget(
      child: CustomResponsiveWidget(
        desktopView: desktop(context),
        tabletView: tablet(context),
        mobileView: tablet(context),
      ),
    );
  }

  Widget desktop(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: Material(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(),
                const CustomText(
                  text: 'Shopping Cart',
                  size: 27,
                ),
                CustomButton(
                  height: 30,
                  width: 150,
                  onPress: () {
                    VxNavigator.of(context)
                        .push(Uri.parse(RouteClass.orderSummary));
                  },
                  title: 'Buy all now',
                  fontSize: 15.0,
                  buttonColor: Theme.of(context).primaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
            PaginateFirestore(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilderType: PaginateBuilderType.gridView,
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 100.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.95,
              ),
              emptyDisplay: const Center(
                child: CustomText(
                  text: 'Opps, No item Found!',
                  fontWeight: FontWeight.w300,
                  size: 30,
                  textAlign: TextAlign.center,
                ),
              ),
              bottomLoader: const SizedBox(
                height: 50,
                width: 50,
                child: Center(child: CircularProgressIndicator()),
              ),
              initialLoader: const Center(child: CircularProgressIndicator()),
              onError: (Exception e) {
                return Center(child: CustomText(text: e.toString()));
              },
              itemBuilder: (
                int index,
                BuildContext context,
                DocumentSnapshot documentSnapshot,
              ) {
                return CartProductWidget(
                  CartModel.fromMap(documentSnapshot.data()),
                );
              },
              isLive: true,
              query: FirebaseFirestore.instance
                  .collection('userData')
                  .doc(AuthenticationRepo().getUserUid())
                  .collection('cart')
                  .orderBy('timestamp', descending: true),
            ),
          ],
        ),
      ),
    );
  }

  Widget tablet(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: Material(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(),
                const CustomText(
                  text: 'Shopping Cart',
                  size: 20,
                ),
                CustomButton(
                  height: 30,
                  width: 150,
                  onPress: () {
                    VxNavigator.of(context)
                        .push(Uri.parse(RouteClass.orderSummary));
                  },
                  title: 'Buy all now',
                  fontSize: 13.0,
                  buttonColor: Theme.of(context).primaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
            PaginateFirestore(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilderType: PaginateBuilderType.gridView,
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 100.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.65,
              ),
              emptyDisplay: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50.0),
                  Icon(
                    Icons.shopping_cart,
                    size: 60,
                    color: Colors.grey[600],
                  ),
                  const CustomText(
                    text: 'Opps, No item Found!',
                    fontWeight: FontWeight.w300,
                    size: 30,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              bottomLoader: const SizedBox(
                height: 50,
                width: 50,
                child: Center(child: CircularProgressIndicator()),
              ),
              initialLoader: const Center(child: CircularProgressIndicator()),
              onError: (Exception e) {
                return Center(child: CustomText(text: e.toString()));
              },
              itemBuilder: (
                int index,
                BuildContext context,
                DocumentSnapshot documentSnapshot,
              ) {
                return CartProductWidget(
                  CartModel.fromMap(documentSnapshot.data()),
                );
              },
              isLive: true,
              query: FirebaseFirestore.instance
                  .collection('userData')
                  .doc(AuthenticationRepo().getUserUid())
                  .collection('cart')
                  .orderBy('timestamp', descending: true),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CartProductWidget extends StatelessWidget {
  CartProductWidget(this.cartItem, {this.width, this.height});

  final CartModel cartItem;
  final double height;
  final double width;
  bool showed = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            width: size.width * 0.22,
            height: size.height * 0.30,
            child: CustomImageWidget(
              imageWidgetType: ImageWidgetType.network,
              imageUrl: cartItem.images.first,
            ),
          ),
          const Spacer(),
          Column(
            children: <Widget>[
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: <Widget>[
              //     CustomText(
              //       text: 'Name',
              //       size: 15,
              //       color: Theme.of(context).accentColor,
              //     ),
              //     CustomText(
              //       text: cartItem.productName,
              //       size: 13,
              //       fontWeight: FontWeight.w300,
              //       color: Theme.of(context).accentColor,
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: 'Brand',
                    size: 15,
                    color: Theme.of(context).accentColor,
                  ),
                  CustomText(
                    text: cartItem.productBrand,
                    size: 13,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: 'Size',
                    size: 15,
                    color: Theme.of(context).accentColor,
                  ),
                  CustomText(
                    text: '${cartItem.size}r',
                    size: 13,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    text: '\u20A6',
                    size: 15,
                    color: Theme.of(context).accentColor,
                  ),
                  CustomText(
                    text: '${cartItem.price}',
                    size: 13,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ],
          ),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (BuildContext context, ProductState state) {
              if (state is ErrorDeleteProductFromCartState) {
                CustomWarningDialog.showSnackBar(
                  context: context,
                  message: state.message,
                );
              }
            },
            builder: (BuildContext context, ProductState state) {
              if (state is LoadingDeleteProductFromCartState &&
                  state.id == cartItem.id) {
                return const Center(child: CircularProgressIndicator());
              }
              return CustomButton(
                title: 'Remove',
                fontSize: 11,
                radius: 4.0,
                height: 30.0,
                buttonColor: Theme.of(context).accentColor,
                onPress: () {
                  BlocProvider.of<ProductBloc>(context)
                      .add(DeleteProductFromCartEvent(cartItem.id));
                },
              );
            },
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
