part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class ProductLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends HomeState {
  final List<ProductDataModel> products;

  ProductLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

class ProductCartedState extends HomeState {

  @override
  List<Object> get props => throw UnimplementedError();
}

class ProductLoadErrorState extends HomeState {
  final String error;
  ProductLoadErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
