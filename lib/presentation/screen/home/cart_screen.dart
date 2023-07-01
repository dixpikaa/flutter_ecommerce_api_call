import 'package:apifetch/presentation/screen/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/add_to_cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartBloc = CartBloc();

  @override
  void initState() {
    _cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cartBloc,
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          // if (state is CartDeletedState) {
          //   Future.delayed(const Duration(seconds: 1), () {
          //     print("On removed listener called");
          //     Fluttertoast.showToast(
          //         msg: "Cart Deleted",
          //         backgroundColor: Colors.grey[700],
          //         textColor: Colors.white);
          //   });
          // }
        },
        child: Scaffold(
          body: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CartStateLoaded) {

                // List<ProductDataModel> productList = ;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final productItem = state.items[index];

                    return AddToCartWidget(
                      cartItems: productItem,
                      onPressed: () {
                        _cartBloc.add(
                          DeleteCartEvent(
                            productItem,
                          ),
                        );
                      },
                    );
                  },
                );
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}