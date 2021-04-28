import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:wheels_and_tires_admin/auth/bloc/product_bloc.dart';
import 'package:wheels_and_tires_admin/auth/model/product_model.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_button.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_dialog.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_image_widget.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_text.dart';
import 'package:wheels_and_tires_admin/ui/shared_widgets/custom_textfield.dart';
import 'package:wheels_and_tires_admin/utils/eums.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PaginateFirestore(
          itemBuilderType: PaginateBuilderType.listView,
          itemBuilder: (index, context, documentSnapshot) {
            ProductModel product =
                ProductModel.fromMap(documentSnapshot.data());
            return ItemWidget(product);
          },
          query: FirebaseFirestore.instance
              .collection('products')
              .orderBy('timestamp', descending: true),
          isLive: true),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget(this.product);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: 100,
                width: 100,
                child: CustomImageWidget(
                  imageWidgetType: ImageWidgetType.network,
                  imageUrl: product.images.first,
                ),
              ),
              title: CustomText(
                text: product.productName,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Size: ${product.size}',
                    fontWeight: FontWeight.w300,
                  ),
                  CustomText(
                    text: 'Price: #${product.price}',
                    fontWeight: FontWeight.w300,
                  ),
                  CustomText(
                    text: 'Type: ${product.type.toUpperCase()}',
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomButton(
                  height: 30,
                  width: 100,
                  onPress: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext dialogContext) {
                        return SizedBox(
                          // height: MediaQuery.of(context).size.height * 0.80,
                          // width: MediaQuery.of(context).size.width,
                          child: AlertDialog(
                            title: Center(child: Text('Edit Product')),
                            content: EditProduct(product),
                          ),
                        );
                      },
                    );
                  },
                  title: 'Edit',
                  buttonColor: Colors.green,
                  fontSize: 12.0,
                ),
                CustomButton(
                  height: 30,
                  width: 100,
                  onPress: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext dialogContext) {
                        return SizedBox(
                          // height: MediaQuery.of(context).size.height * 0.80,
                          // width: MediaQuery.of(context).size.width,
                          child: AlertDialog(
                            title: Center(child: Text('Edit Product')),
                            content: DeleteProduct(product),
                          ),
                        );
                      },
                    );
                  },
                  title: 'Delete',
                  buttonColor: Colors.red,
                  fontSize: 12.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EditProduct extends StatelessWidget {
  EditProduct(this.product);

  final ProductModel product;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productBrandController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  Future<void> validate(BuildContext context) async {
    final FormState formState = formKey.currentState;

    print('dd');
    if (formState.validate()) {
      print('ddddee');
      final String productName = productNameController.text.trim();
      final String productBrand = productBrandController.text.trim();
      final String size = sizeController.text.trim();
      final String price = priceController.text.trim();

      Map data = <String, dynamic>{
        if (productName.isNotEmpty) "productName": productName,
        if (productBrand.isNotEmpty) "productBrand": productBrand,
        if (size.isNotEmpty) "size": int.parse(size),
        if (price.isNotEmpty) "price": int.parse(price),
      };

      BlocProvider.of<ProductBloc>(context).add(EditProductEvent(
        data: data,
        id: product.productId,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: const BoxDecoration(color: Colors.white),
      child: Form(
        key: formKey,
        child: ListView(

          children: <Widget>[
            const SizedBox(height: 20.0),
            CustomTextField(
              controller: productNameController,
              title: 'Product name',
              length: 3,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: productBrandController,
              title: 'Product brand',
              length: 0,
              warn: false,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: sizeController,
              title: 'size',
              keyboardType: TextInputType.number,
              length: 0,
              warn: false,
            ),
            const SizedBox(height: 15.0),
            CustomTextField(
              controller: priceController,
              title: 'Price',
              keyboardType: TextInputType.number,
              length: 0,
              warn: false,
            ),
            const SizedBox(height: 15.0),
            BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is ErrorEditProduct) {
                  CustomWarningDialog.showSnackBar(
                    context: context,
                    message: state.message,
                    warning: true,
                  );
                } else if (state is LoadedEditProduct) {
                  Navigator.pop(context);
                  CustomWarningDialog.showSnackBar(
                    context: context,
                    message: 'Edit Successful',
                    warning: false,
                  );
                }
              },
              builder: (context, state) {
                if (state is LoadingEditProduct) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Center(
                    child: CustomButton(
                      width: MediaQuery.of(context).size.width * 0.45,
                      buttonColor: Theme.of(context).primaryColor,
                      title: 'Upload',
                      fontSize: 18.0,
                      onPress: () => validate(context),
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

class DeleteProduct extends StatelessWidget {
  DeleteProduct(this.product);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: const BoxDecoration(color: Colors.white),
      child: ListView(
        children: <Widget>[
          const SizedBox(height: 20.0),
          CustomText(
            text: 'Are you sure you want to delete this product',
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15.0),
          BlocConsumer<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state is ErrorDeleteProduct) {
                CustomWarningDialog.showSnackBar(
                  context: context,
                  message: state.message,
                  warning: true,
                );
              } else if (state is LoadedDeleteProduct) {
                Navigator.pop(context);
                CustomWarningDialog.showSnackBar(
                  context: context,
                  message: 'Edit Successful',
                  warning: false,
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingDeleteProduct) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Center(
                  child: CustomButton(
                    width: MediaQuery.of(context).size.width * 0.30,
                    buttonColor: Theme.of(context).primaryColor,
                    title: 'Delete',
                    fontSize: 18.0,
                    onPress: () => BlocProvider.of<ProductBloc>(context)
                        .add(DeleteProductEvent(product.productId)),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
