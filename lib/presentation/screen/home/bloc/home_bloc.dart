import 'package:apifetch/data_layer/cart_repository.dart';
import 'package:apifetch/data_layer/repository/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/models/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository _productRepository;



  HomeBloc(this._productRepository) : super(ProductLoadingState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await _productRepository.getProduct();
        emit(ProductLoadedState(products));
      } catch (e) {
        ProductLoadErrorState(e.toString());
      }
    });
    on<ProductCartEvent>((event, emit) async{
      cartItems.add(event.product);
      print("Clicked add to cart");
      emit(ProductCartedState());
    });
  }
}
