import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wheels_and_tires_admin/auth/bloc/product_bloc.dart';
import 'package:wheels_and_tires_admin/auth/model/product_model.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_button.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_dialog.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_image_widget.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_textfield.dart';
import 'package:wheels_and_tires_admin/utils/eums.dart';
import 'package:wheels_and_tires_admin/utils/uuid.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productBrandController = TextEditingController();
  final TextEditingController productInfoController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<File> _imageFile = ValueNotifier<File>(null);
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> validate() async {
    final FormState formState = formKey.currentState;

    if (formState.validate() && _imageFile.value != null) {
      final String productName = productNameController.text.trim();
      final String productBrand = productBrandController.text.trim();
      final String productInfo = productInfoController.text.trim();
      final String type = typeController.text.trim().toLowerCase();
      final String size = sizeController.text.trim();
      final String price = priceController.text.trim();

      ProductModel product = ProductModel(
        productId: Uuid.createCryptoRandomString(8),
        productName: productName,
        productBrand: productBrand,
        productInfo: productInfo,
        type: type,
        images: [],
        size: int.parse(size),
        price: int.parse(price),
        timestamp: Timestamp.now(),
      );

      BlocProvider.of<ProductBloc>(context)
          .add(AddProduct(product, _imageFile.value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: ValueListenableBuilder<File>(
                valueListenable: _imageFile,
                builder: (_, File image, Widget child) {
                  if (image == null) {
                    return SizedBox(
                      height: 100,
                      width: 120,
                      child: InkWell(
                        onTap: () => pickImage(),
                        child: Placeholder(),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: 100,
                      width: 120,
                      child: InkWell(
                        onTap: () => pickImage(),
                        child: CustomImageWidget(
                          imageWidgetType: ImageWidgetType.file,
                          imageUrl: 'imageUrl',
                          imageFile: image,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            CustomTextField(
              controller: productNameController,
              title: 'Product name',
              length: 3,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: productBrandController,
              title: 'Product brand',
              length: 3,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: productInfoController,
              title: 'Product Info',
              length: 0,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: typeController,
              title: 'Type e.g Tyres/Tubes/Rims',
              length: 3,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: sizeController,
              title: 'size',
              keyboardType: TextInputType.number,
              length: 1,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: priceController,
              title: 'Price',
              keyboardType: TextInputType.number,
              length: 1,
            ),
            const SizedBox(height: 15.0),
            const SizedBox(height: 15.0),
            BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ErrorAddProduct) {
                  CustomWarningDialog.showSnackBar(
                    context: context,
                    message: state.message,
                    warning: true,
                  );
                } else if (state is LoadedAddProduct) {
                  formKey.currentState.reset();
                  _imageFile.value = null;
                  CustomWarningDialog.showSnackBar(
                    context: context,
                    message: 'Upload Successful',
                    warning: false,
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingAddProduct) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: CustomButton(
                      width: MediaQuery.of(context).size.width * 0.65,
                      buttonColor: Theme.of(context).primaryColor,
                      title: 'Upload',
                      fontSize: 18.0,
                      onPress: () => validate(),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
