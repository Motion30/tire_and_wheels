import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wheels_and_tires_admin/auth/model/product_model.dart';
import 'package:wheels_and_tires_admin/auth/repo/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(InitialProductState());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is AddProduct) {
      try {
        yield LoadingAddProduct();
        await ProductRepo().addProduct(event.product, event.image);
        yield LoadedAddProduct();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        yield ErrorAddProduct(e?.message.toString());
      }
    } else if (event is EditProductEvent) {
      try {
        yield LoadingEditProduct();
        await ProductRepo().editProduct(data: event.data, id: event.id);
        yield LoadedEditProduct();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        yield ErrorEditProduct(e?.message.toString());
      }
    } else if (event is DeleteProductEvent) {
      try {
        yield LoadingDeleteProduct();
        await ProductRepo().deleteProduct(event.id);
        yield LoadedDeleteProduct();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        yield ErrorDeleteProduct(e?.message.toString());
      }
    }
  }
}
