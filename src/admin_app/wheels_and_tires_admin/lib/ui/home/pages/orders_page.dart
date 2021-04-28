import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_text.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PaginateFirestore(
        itemBuilderType: PaginateBuilderType.listView,
        itemBuilder: (index, context, documentSnapshot) => ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text(documentSnapshot.data()['name'].toString()),
          subtitle: Text(documentSnapshot.id),
        ),
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
            .orderBy('timestamp'),
        isLive: true,
      ),
    );
  }
}
