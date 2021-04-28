part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class AddProduct extends ProductEvent {
  const AddProduct(this.product, this.image);

  final ProductModel product;
  final File image;

  @override
  List<Object> get props => <Object>[product];
}

class EditProductEvent extends ProductEvent {
  const EditProductEvent({this.data, this.id});

  final Map data;
  final String id;

  @override
  List<Object> get props => <Object>[data];
}

class DeleteProductEvent extends ProductEvent {
  const DeleteProductEvent(this.id);

  final String id;

  @override
  List<Object> get props => <Object>[id];
}
