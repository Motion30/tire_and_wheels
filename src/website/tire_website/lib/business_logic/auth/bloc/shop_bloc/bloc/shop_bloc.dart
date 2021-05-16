import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tire_website/business_logic/auth/model/product_model.dart';
import 'package:tire_website/business_logic/auth/model/user_details_model.dart';
import 'package:tire_website/business_logic/auth/repo/authentication_repo.dart';
import 'package:tire_website/business_logic/auth/repo/product_repo.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(InitialShopState());

  @override
  Stream<ShopState> mapEventToState(
    ShopEvent event,
  ) async* {
    if (event is GetAllCartItemEvent) {
      try {
        yield LoadingShopState();

        final List<CartModel> cartList = await ProductRepo().getCartItems();
        final Map<String, dynamic> data =
            await AuthenticationRepo().getLoginUserDetails();

        yield LoadedShopState(cartList, UserDetails.fromMap(data));
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());

        yield ErrorShopState(e?.message.toString());
      }
    }
  }
}
