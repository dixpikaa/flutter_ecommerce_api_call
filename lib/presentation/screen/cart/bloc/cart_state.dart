part of 'cart_bloc.dart';

abstract class CartState {
  const CartState();
}

class CartInitialState extends CartState {}

class CartStateLoaded extends CartState {
  final List<ProductDataModel> items;

  const CartStateLoaded(this.items);
}

class CartStateError extends CartState {
  final String errorMessage;

  const CartStateError(this.errorMessage);
}