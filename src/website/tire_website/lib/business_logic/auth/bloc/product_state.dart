part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class InitialProductState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class InitialAddProductToCartState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadingAddProductToCartState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadedAddProductToCartState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class ErrorAddProductToCartState extends ProductState {
  const ErrorAddProductToCartState(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[];
}

class InitialAddProductToOrderState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadingAddProductToOrderState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadedAddProductToOrderState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class ErrorAddProductToOrderState extends ProductState {
  const ErrorAddProductToOrderState(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[];
}
