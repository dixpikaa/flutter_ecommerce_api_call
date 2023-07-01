import 'dart:async';

import 'package:apifetch/data_layer/cart_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/models/product_model.dart';
import 'model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  CartBloc() : super(CartInitialState()) {
    on<AddToCartEvent>(_addToCartEvent);
    on<DeleteCartEvent>(_deleteCartEvent);
    on<CartInitialEvent>((event, emit) async {
      emit(CartStateLoaded(cartItems));
    });
  }

  Future<void> _addToCartEvent(
      AddToCartEvent event, Emitter<CartState> emit) async {
    try {
      cartItems.add(event.cartItems);
      emit(CartStateLoaded(List.from(cartItems)));
    } catch (ex) {
      emit(CartStateError(ex.toString()));
    }
  }

  Future<void> _deleteCartEvent(
      DeleteCartEvent event, Emitter<CartState> emit) async {
    try {
      final deleteItem = cartItems.firstWhere((item) => item.id == event.removeItem.id);
      cartItems.remove(deleteItem);
      emit(CartStateLoaded(List.from(cartItems)));
    } catch (ex) {
      emit(CartStateError(ex.toString()));
    }
  }
}
  // Future<void> _updateCartEvent(
  //   UpdateCartEvent event ,Emitter<CartState>emit)async{
  //   try{
  //       final index =
  //         carts.indexWhere((cartItems) => cartItems.cartId == event.cartItems.cartId);
  //     if (index >= 0) {
  //       carts[index] = event.cartItems;
  //       emit(CartStateLoaded(List.from(carts)));
  //     }
  //       } catch (ex) {
  //     emit(CartStateError(ex.toString()));
  // }
   
  
