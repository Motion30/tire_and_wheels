import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:wheels_and_tires_admin/auth/model/address_model.dart';
import 'package:wheels_and_tires_admin/auth/model/order_model.dart';
import 'package:wheels_and_tires_admin/ui/home/pages/selected_order_item_page.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_text.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PaginateFirestore(
        separator: const Divider(),
        itemBuilderType: PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot) {
          final OrderModel order = OrderModel.fromMap(documentSnapshot.data());

          final AddressModel address = AddressModel.fromMap(order.address);

          return ListTile(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelectedOrder(order),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(order.userData['fullname']),
                Text(order.userData['phone']),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Number of item: ${order.products.length}'),
                Text(
                  'Address: ${address.address}, ${address.city}. ${address.state}',
                ),
                Text('Status: ${order.status}'),
                Text(
                  'Date: ${order.timestamp?.toDate().toString().split(' ')[0]} '
                  'at ${order.timestamp?.toDate().toString().split(' ')[1].toString().substring(0, 5)}',
                ),
              ],
            ),
          );
        },
        emptyDisplay: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.shopping_cart_outlined, size: 80),
              CustomText(
                text: 'Opps, No Order Found',
                fontWeight: FontWeight.w300,
                size: 25.0,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        query: FirebaseFirestore.instance
            .collection('orders')
            .orderBy('timestampe'),
        isLive: true,
      ),
    );
  }
}
