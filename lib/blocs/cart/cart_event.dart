part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

}

class StartCart extends CartEvent {
  @override
  List<Object> get props => [];
}

class AddCartProduct extends CartEvent {
  final Product product;

  const AddCartProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveCartProduct extends CartEvent {
  final Product product;

  const RemoveCartProduct(this.product);

  @override
  List<Object> get props => [product];
}