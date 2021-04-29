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

    yield* userRef.doc(userId).snapshots();
  }
}
