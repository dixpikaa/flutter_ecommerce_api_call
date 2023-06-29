part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

}
class CartInitialEvent extends CartEvent{
  
  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
   final ProductDataModel cartItems;

 const  AddToCartEvent(this.cartItems);
 
  @override
  List<Object?> get props => [cartItems];
}
class DeleteCartEvent extends CartEvent {
   final ProductDataModel removeItem;

 const  DeleteCartEvent(this.removeItem);
 
  @override
  List<Object?> get props => [removeItem];
}

class UpdateCartEvent extends CartEvent {
    final AddToCart cartItems;
   const UpdateCartEvent(this.cartItems);
   
     @override
     List<Object?> get props => throw UnimplementedError();


}

