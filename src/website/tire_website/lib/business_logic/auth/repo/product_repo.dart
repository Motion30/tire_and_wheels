import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tire_website/business_logic/auth/model/address_model.dart';
import 'package:tire_website/business_logic/auth/model/order_model.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/business_logic/auth/repo/authentication_repo.dart';
import 'package:tire_website/utils/uuid.dart';

class ProductRepo {
  static final CollectionReference productRef =
      FirebaseFirestore.instance.collection('product');
  static final CollectionReference userRef =
      FirebaseFirestore.instance.collection('userData');
  static final CollectionReference ordersRef =
      FirebaseFirestore.instance.collection('orders');

  Future<void> addProductToCart(ProductModel product) async {
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    if (AuthenticationRepo().auth.currentUser == null) {
      throw Exception('Please Login or Sign up to Processed');
    }

    final String userUid = AuthenticationRepo().getUserUid();
    final String docId = Uuid().createCryptoRandomString(10);

    batch.set(
      userRef.doc(userUid).collection('cart').doc(docId),
      <String, dynamic>{'id': docId, ...product.toMap()},
    );

    batch.update(
      userRef.doc(userUid),
      <String, dynamic>{'cartCount': FieldValue.increment(1)},
    );

    await batch.commit();
  }

  Future<void> deleteProductFromCart(String id) async {
    final WriteBatch batch = FirebaseFirestore.instance.batch();

    if (AuthenticationRepo().auth.currentUser == null) {
      throw Exception('Please Login or Sign up to Processed');
    }

    final String userUid = AuthenticationRepo().getUserUid();

    batch.delete(userRef.doc(userUid).collection('cart').doc(id));

    batch.update(
      userRef.doc(userUid),
      <String, dynamic>{'cartCount': FieldValue.increment(-1)},
    );

    await batch.commit();

    // await userRef.doc(userUid).collection('cart').doc(id).delete();
  }

  Future<void> addProductToOrder({
    List<ProductModel> products,
    AddressModel address,
  }) async {
    final List<Map<String, dynamic>> productsList =
        products.map((ProductModel product) => product.toMap()).toList();

    if (AuthenticationRepo().auth.currentUser == null) {
      throw Exception('Please Login or Sign up to Processed');
    }

    final String userUid = AuthenticationRepo().getUserUid();
    final Map<String, dynamic> userData =
        await AuthenticationRepo().getUserDetailsMap(userUid);

    final OrderModel order = OrderModel(
      userData: userData,
      address: address.toMap(),
      products: productsList,
      status: 'pending',
    );

    await userRef.doc(userUid).collection('order').add(order.toMap());
  }

  Stream<DocumentSnapshot> cartStream() async* {
    final String userId = AuthenticationRepo().getUserUid();

    if (userId != null) {
      yield* userRef.doc(userId).snapshots();
    }
  }

  Future<List<CartModel>> getCartItems() async {
    final List<CartModel> cartItem = <CartModel>[];
    final String userUid = AuthenticationRepo().getUserUid();

    final QuerySnapshot querySnapshot =
        await userRef.doc(userUid).collection('cart').get();

    cartItem.addAll(querySnapshot.docs
        .map((QueryDocumentSnapshot e) => CartModel.fromMap(e.data()))
        .toList());

    return cartItem;
  }

  Future<void> addOrder(OrderModel order) async {
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    final String userUid = AuthenticationRepo().getUserUid();

    batch.set(
      ordersRef.doc(),
      order.toMap(),
    );

    batch.update(
      userRef.doc(userUid),
      <String, dynamic>{'cartCount': 0},
    );

    final QuerySnapshot querySnapshot =
        await userRef.doc(userUid).collection('cart').get();

    final List<QueryDocumentSnapshot> docs = querySnapshot.docs;

    for (int i = 0; i < docs.length; i++) {
      final QueryDocumentSnapshot currentDoc = docs[i];

      batch.delete(
        userRef.doc(userUid).collection('cart').doc(currentDoc.id),
      );
    }

    await batch.commit();
  }
}
