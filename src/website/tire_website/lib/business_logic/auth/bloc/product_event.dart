part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class AddProductToCart extends ProductEvent {
  const AddProductToCart(this.product);

  final ProductModel product;

  @override
  List<Object> get props => <Object>[product];
}

class AddProductToOrder extends ProductEvent {
  const AddProductToOrder({this.products, this.address});

  final List<ProductModel> products;
  final AddressModel address;

  @override
  List<Object> get props => <Object>[products, address];
}

class DeleteProductFromCartEvent extends ProductEvent {
  const DeleteProductFromCartEvent(this.id);

  final String id;

  @override
  List<Object> get props => <Object>[id];
}

class AddOrderEvent extends ProductEvent {
  const AddOrderEvent(this.order);

  final OrderModel order;

  @override
  List<Object> get props => <Object>[];
}
