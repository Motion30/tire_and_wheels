part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => <Object>[];
}

class GetAllCartItemEvent extends ShopEvent {
  @override
  List<Object> get props => <Object>[];
}
