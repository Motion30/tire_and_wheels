import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wheels_and_tires_admin/auth/model/product_model.dart';

class ProductRepo {
  static final CollectionReference productRef =
      FirebaseFirestore.instance.collection('products');
  static final CollectionReference orderRef =
      FirebaseFirestore.instance.collection('orders');
  static final CollectionReference userRef =
      FirebaseFirestore.instance.collection('userData');

  Future<void> addProduct(ProductModel product, File image) async {
    String _image = await ProductRepo().uploadImageToFirebase(image);

    Map data = product.toMap();
    data['images'] = [_image];

    await productRef.doc(product.productId).set(data);
  }

  Future<void> editProduct({String id, Map data}) async {
    await productRef.doc(id).update(data);
  }

  Future<void> deleteProduct(String id) async {
    await productRef.doc(id).delete();
  }

  Future<void> markOrderAsComplete(String id) async {
    await orderRef.doc(id).update({
      'status': 'Completed',
    });
  }

  Future<String> uploadImageToFirebase(File image) async {
    String fileName = image.path;
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask;

    return await taskSnapshot.ref.getDownloadURL();
  }
}
