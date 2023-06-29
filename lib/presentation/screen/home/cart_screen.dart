import 'package:apifetch/presentation/screen/cart/bloc/cart_bloc.dart';
import 'package:apifetch/presentation/screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../domain/models/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartbloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cartbloc..add(CartInitialEvent()),
      child: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is CartDeletedState) {
            Future.delayed(const Duration(seconds: 1), () {
              print("On removed listener called");
              Fluttertoast.showToast(
                  msg: "Cart Deleted",
                  backgroundColor: Colors.grey[700],
                  textColor: Colors.white);
            });
          }

          // TODO: implement listener
        },
        child: Scaffold(
            body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartStateLoaded) {
            List<ProductDataModel> productList = state.cartItems;
            return ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return AddToCartWidget(
                    cartItems: productList[index],
                    onPressed: () {
                      _cartbloc.add(DeleteCartEvent( productList[index]));
                    },
                  );
                });
          }

          return Container();
        })),
      ),
    );
  }
}
