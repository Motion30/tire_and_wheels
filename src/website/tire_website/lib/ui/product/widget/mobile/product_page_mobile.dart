import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:tire_website/business_logic/auth/bloc/product_bloc.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/business_logic/auth/repo/product_repo.dart';
import 'package:tire_website/ui/cart/cart_page.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_dialog.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/logo_widget.dart';
import 'package:tire_website/ui/shared_widgets/side_menu.dart';
import 'package:tire_website/utils/eums.dart';

import '../../../../business_logic/auth/repo/authentication_repo.dart';
import '../../../shared_widgets/custom_dialog.dart';

class ProductWidgetMobile extends StatelessWidget {
  ProductWidgetMobile({this.type});

  final String type;
  final GlobalKey<SliderMenuContainerState> _key =
      GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SliderMenuContainer(
                appBarColor: Theme.of(context).primaryColor,
                drawerIconColor: Colors.white,
                key: _key,
                sliderMenuOpenSize: 200,
                title: const LogoWidget(),
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
                                Navigator.of(context).push(
                                  MaterialPageRoute<Widget>(
                                    builder: (BuildContext context) =>
                                        const CartPage(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: CustomText(
                                text: '${product.cartCount}',
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                size: 10.0,
                              ),
                            ),
                          ],
                        );
                      }
                      return IconButton(
                        onPressed: () {
                          if (AuthenticationRepo().getUserUid() != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute<Widget>(
                                builder: (BuildContext context) =>
                                    const CartPage(),
                              ),
                            );
                          } else {
                            CustomWarningDialog.showSnackBar(
                              message: 'Please Login or Sigup',
                              context: context,
                            );
                          }
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
                  child: ProductPageBodyMobile(type: type),
                ),
              ),
            ),
            // const ProductPageBodyMobile(),
          ],
        ),
        // child:
      ),
    );
  }
}

class ProductPageBodyMobile extends StatelessWidget {
  const ProductPageBodyMobile({this.type});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Body(type: type);
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget(this.product);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: size.width * 0.22,
              height: size.height * 0.25,
              child: CustomImageWidget(
                imageWidgetType: ImageWidgetType.network,
                imageUrl: product.images.first,
              ),
            ),
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
                //       text: product.productName,
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
                      text: product.productBrand,
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
                      text: '${product.size}r',
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
                      text: '${product.price}',
                      size: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                BlocConsumer<ProductBloc, ProductState>(
                  listener: (BuildContext context, ProductState state) {
                    if (state is ErrorAddProductToCartState) {
                      CustomWarningDialog.showSnackBar(
                        context: context,
                        message: state.message,
                      );
                    }
                  },
                  builder: (BuildContext context, ProductState state) {
                    if (state is LoadingAddProductToCartState &&
                        state.id == product.productId) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      title: 'Add To Cart',
                      fontSize: 10,
                      radius: 2.0,
                      height: 25.0,
                      buttonColor: Theme.of(context).primaryColor,
                      onPress: () {
                        BlocProvider.of<ProductBloc>(context)
                            .add(AddProductToCart(product));
                      },
                    );
                  },
                ),
                CustomButton(
                  title: 'Buy Now',
                  fontSize: 10,
                  radius: 2.0,
                  height: 25.0,
                  buttonColor: Theme.of(context).accentColor,
                  onPress: () {
                    //TODO: buy now function
                  },
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            CustomButton(
              title: 'Check Out',
              fontSize: 11,
              radius: 2.0,
              height: 30.0,
              width: 80.0,
              buttonColor: Theme.of(context).primaryColor,
              onPress: () {
                //TODO: check out function
              },
            ),
            const SizedBox(height: 3.0),
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({this.type});

  final String type;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ValueNotifier<String> sortValueNotifier = ValueNotifier<String>('Date');

  final ValueNotifier<Query> sortResultNotifier = ValueNotifier<Query>(
    FirebaseFirestore.instance.collection('products').orderBy('timestamp'),
  );

  final ValueNotifier<bool> refreshNotifier = ValueNotifier<bool>(false);

  Future<void> set() async {
    refreshNotifier.value = true;
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));

    sortResultNotifier.value = FirebaseFirestore.instance
        .collection('products')
        .where('type', isEqualTo: widget.type.toLowerCase())
        .orderBy('timestamp');
    refreshNotifier.value = false;
  }

  @override
  void initState() {
    set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const SizedBox(height: 10.0),
          Center(
            child: CustomText(
              text: widget.type ?? 'Tyres',
              size: 20.0,
            ),
          ),
          const SizedBox(height: 12.0),
          dropDown(context),
          const SizedBox(height: 50.0),
          ValueListenableBuilder<bool>(
            valueListenable: refreshNotifier,
            builder: (BuildContext context, bool loading, Widget child) {
              if (loading == true) {
                return const Center(child: CircularProgressIndicator());
              }

              return PaginateFirestore(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilderType: PaginateBuilderType.gridView,
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 100.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
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
                  return ProductWidget(
                    ProductModel.fromMap(documentSnapshot.data()),
                  );
                },
                query: sortResultNotifier.value,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget dropDown(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Center(
          child: CustomText(
            text: 'Sort By: ',
            size: 18.0,
          ),
        ),
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).accentColor),
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
          ),
          width: 200.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ValueListenableBuilder<String>(
              valueListenable: sortValueNotifier,
              builder: (BuildContext context, String sortInput, Widget child) {
                return DropdownButton<String>(
                  elevation: 2,
                  iconEnabledColor: Colors.black,
                  value: sortInput,
                  underline: const SizedBox(),
                  items: <String>['Date', 'Size', 'Price', 'Name']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CustomText(
                        text: value,
                      ),
                    );
                  }).toList(),
                  onChanged: (String val) {
                    sortValueNotifier.value = val;

                    if (val.toLowerCase() == 'size') {
                      sortResultNotifier.value = FirebaseFirestore.instance
                          .collection('products')
                          .where('type',
                              isEqualTo: widget.type.toUpperCase() ?? 'types')
                          .orderBy('size');
                    } else if (val.toLowerCase() == 'price') {
                      sortResultNotifier.value = FirebaseFirestore.instance
                          .collection('products')
                          .where('type',
                              isEqualTo: widget.type.toUpperCase() ?? 'types')
                          .orderBy('price');
                    } else if (val.toLowerCase() == 'name') {
                      sortResultNotifier.value = FirebaseFirestore.instance
                          .collection('products')
                          .where('type',
                              isEqualTo: widget.type.toUpperCase() ?? 'types')
                          .orderBy('productName');
                    } else if (val.toLowerCase() == 'date') {
                      sortResultNotifier.value = FirebaseFirestore.instance
                          .collection('products')
                          .where('type',
                              isEqualTo: widget.type.toUpperCase() ?? 'types')
                          .orderBy('timestamp');
                    }
                    set();
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
