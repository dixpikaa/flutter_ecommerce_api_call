part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadProductEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
class ProductCartEvent extends HomeEvent{
  final ProductDataModel product;
  const ProductCartEvent(this.product);
  
  @override
  // TODO: implement props
  List<Object?> get props => [product];
}