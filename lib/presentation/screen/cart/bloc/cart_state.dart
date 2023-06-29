part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  
}

class CartInitialState extends CartState {
  @override
  List<Object> get props => [];

}


class CartStateLoaded extends CartState {
  final List<ProductDataModel> cartItems;

  const CartStateLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];

}

class CartDeletedState extends CartState{
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}

class CartStateError extends CartState {
  final String errorMessage;

 const CartStateError(this.errorMessage);
 @override
  List<Object> get props => [errorMessage];
}



