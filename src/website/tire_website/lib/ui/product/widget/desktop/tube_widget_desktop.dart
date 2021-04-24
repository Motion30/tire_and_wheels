import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/ui/shared_widgets/custom_button.dart';
import 'package:tire_website/ui/shared_widgets/custom_image_widget.dart';
import 'package:tire_website/ui/shared_widgets/custom_text.dart';
import 'package:tire_website/ui/shared_widgets/header_widget.dart';
import 'package:tire_website/ui/shared_widgets/hover_widget.dart';
import 'package:tire_website/ui/shared_widgets/side_menu.dart';
import 'package:tire_website/utils/eums.dart';

class ProductWidgetDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const <Widget>[
          HeaderWidget(),
          ProductPageBodyDesktop(),
        ],
      ),
    );
  }
}

class ProductPageBodyDesktop extends StatelessWidget {
  const ProductPageBodyDesktop();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const SideMenu(),
        Body(),
      ],
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget(this.product);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
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
            width: 220.0,
            height: 180.0,
            child: CustomImageWidget(
              imageWidgetType: ImageWidgetType.network,
              imageUrl: product.images.first,
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: 'Product Name',
                    size: 18,
                    color: Theme.of(context).accentColor,
                  ),
                  CustomText(
                    text: product.productName,
                    size: 16,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: 'Product Brand',
                    size: 18,
                    color: Theme.of(context).accentColor,
                  ),
                  CustomText(
                    text: product.productBrand,
                    size: 16,
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
                    size: 18,
                    color: Theme.of(context).accentColor,
                  ),
                  CustomText(
                    text: '${product.size}r',
                    size: 16,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: 'Price',
                    size: 18,
                    color: Theme.of(context).accentColor,
                  ),
                  CustomText(
                    text: '#${product.price}',
                    size: 16,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomButton(
                title: 'Add To Cart',
                fontSize: 11,
                radius: 4.0,
                height: 30.0,
                buttonColor: Theme.of(context).primaryColor.withOpacity(0.7),
                onPress: () {
                  //TODO: add to cart function
                },
              ),
              CustomButton(
                title: 'Buy Now',
                fontSize: 11,
                radius: 4.0,
                height: 30.0,
                buttonColor: Theme.of(context).primaryColor.withOpacity(0.7),
                onPress: () {
                  //TODO: buy now function
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  Body({this.type});

  final String type;
  final ValueNotifier<String> sortValueNotifier = ValueNotifier<String>('Size');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Center(
            child: CustomText(
              text: 'Tyres',
              size: 24.0,
            ),
          ),
          const SizedBox(height: 12.0),
          dropDown(context),
          const SizedBox(height: 50.0),
          PaginateFirestore(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilderType: PaginateBuilderType.gridView,
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 100.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 1.1,
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
                  ProductModel.fromMap(documentSnapshot.data()));
            },
            //TODO: update query to use type passed
            query: FirebaseFirestore.instance
                .collection('products')
                .orderBy('productName'),
            // isLive: true // to fetch real-time data
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
            size: 20.0,
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
                  items: <String>['Size', 'Price', 'Name'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: CustomText(
                        text: value,
                      ),
                    );
                  }).toList(),
                  onChanged: (String val) {
                    sortValueNotifier.value = val;
                    //TODO: update result list
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


