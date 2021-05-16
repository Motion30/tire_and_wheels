part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();

  @override
  List<Object> get props => <Object>[];
}

class InitialShopState extends ShopState {}

class LoadingShopState extends ShopState {}

class LoadedShopState extends ShopState {
  const LoadedShopState(this.cartList, this.userData);

  final List<CartModel> cartList;
  final UserDetails userData;
}

class ErrorShopState extends ShopState {
  const ErrorShopState(this.message);
  final String message;
}
