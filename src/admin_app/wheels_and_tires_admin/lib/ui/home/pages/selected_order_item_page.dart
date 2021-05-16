import 'package:flutter/material.dart';
import 'package:wheels_and_tires_admin/auth/model/address_model.dart';
import 'package:wheels_and_tires_admin/auth/model/order_model.dart';
import 'package:wheels_and_tires_admin/auth/model/product_model.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_image_widget.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_text.dart';
import 'package:wheels_and_tires_admin/utils/eums.dart';

class SelectedOrder extends StatelessWidget {
  const SelectedOrder(this.order);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final AddressModel address = AddressModel.fromMap(order.address);

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Items'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        children: <Widget>[
          const SizedBox(height: 20.0),
          CustomText(
            text: 'User Details',
            fontWeight: FontWeight.bold,
            size: 15.0,
          ),
          CustomText(
            text: 'FullName: ${order.userData['fullname']}',
            fontWeight: FontWeight.w300,
            size: 14.0,
          ),
          CustomText(
            text: 'Phone number: ${order.userData['phone']}',
            fontWeight: FontWeight.w300,
            size: 14.0,
          ),
          const SizedBox(height: 20.0),
          CustomText(
            text: 'Address',
            fontWeight: FontWeight.bold,
            size: 15.0,
          ),
          CustomText(
            text:
                'Address: ${address.address}, ${address.city}. ${address.state}',
            fontWeight: FontWeight.w300,
            size: 14.0,
          ),
          const SizedBox(height: 20.0),
          CustomText(
            text: 'Status',
            fontWeight: FontWeight.bold,
            size: 15.0,
          ),
          CustomText(
            text: '${order.status}',
            fontWeight: FontWeight.w300,
            size: 14.0,
          ),
          const SizedBox(height: 20.0),
          CustomText(
            text: 'Product ordered for',
            fontWeight: FontWeight.bold,
            size: 15.0,
          ),
          ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            separatorBuilder: (_, __) => Divider(),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: order.products.length,
            itemBuilder: (context, index) {
              final ProductModel product =
                  ProductModel.fromMap(order.products[index]);
              return Row(
                children: <Widget>[
                  SizedBox(
                    height: 80.0,
                    width: 100.0,
                    child: CustomImageWidget(
                      imageWidgetType: ImageWidgetType.network,
                      imageUrl: product.images.first,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomText(
                        text: product.productName,
                        size: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(
                        text: product.productBrand,
                        size: 12,
                      ),
                      CustomText(
                        text: '# ${product.price}',
                        size: 13,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                color: Colors.green,
                onPressed: () {},
                child: Text('Delivered'),
              ),
              FlatButton(
                color: Colors.green,
                onPressed: () {},
                child: Text('Delivered'),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
