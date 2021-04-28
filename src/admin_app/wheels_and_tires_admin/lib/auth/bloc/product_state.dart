part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class InitialProductState extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

///

class InitialAddProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadingAddProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadedAddProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class ErrorAddProduct extends ProductState {
  const ErrorAddProduct(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[];
}

///
class InitialEditProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadingEditProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadedEditProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class ErrorEditProduct extends ProductState {
  const ErrorEditProduct(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[];
}

///
class InitialDeleteProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadingDeleteProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class LoadedDeleteProduct extends ProductState {
  @override
  List<Object> get props => <Object>[];
}

class ErrorDeleteProduct extends ProductState {
  const ErrorDeleteProduct(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[];
}
