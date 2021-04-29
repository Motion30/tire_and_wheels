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
  const LoadingAddProductToCartState(this.id);
  final String id;

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

///

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

///

class InitialDeleteProductFromCartState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadingDeleteProductFromCartState extends ProductState {
  const LoadingDeleteProductFromCartState(this.id);

  final String id;


  @override
  List<Object> get props => <Object>[];
}

class LoadedDeleteProductFromCartState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class ErrorDeleteProductFromCartState extends ProductState {
  const ErrorDeleteProductFromCartState(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[];
}
