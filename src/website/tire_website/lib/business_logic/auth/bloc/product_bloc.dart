import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tire_website/business_logic/auth/model/address_model.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/business_logic/auth/repo/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(InitialProductState());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is AddProductToCart) {
      try {
        yield LoadingAddProductToCartState(event.product.productId);
        await ProductRepo().addProductToCart(event.product);
        yield LoadedAddProductToCartState();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        yield ErrorAddProductToCartState(e?.message.toString());
      }
    } else if (event is AddProductToOrder) {
      try {
        yield LoadingAddProductToOrderState();
        await ProductRepo().addProductToOrder(
          products: event.products,
          address: event.address,
        );
        yield LoadedAddProductToOrderState();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        yield ErrorAddProductToOrderState(e?.message.toString());
      }
    }else if (event is DeleteProductFromCartEvent) {
      try {
        yield LoadingDeleteProductFromCartState(event.id);
        await ProductRepo().deleteProductFromCart(event.id);
        yield LoadedDeleteProductFromCartState();
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        yield ErrorDeleteProductFromCartState(e?.message.toString());
      }
    }
  }
}
