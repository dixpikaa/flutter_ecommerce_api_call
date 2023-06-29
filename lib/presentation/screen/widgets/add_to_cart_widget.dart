import 'package:apifetch/presentation/screen/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:apifetch/domain/models/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddToCartWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final ProductDataModel cartItems;
  const AddToCartWidget({
    super.key,
    required this.onPressed,
    required this.cartItems,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(cartItems.image),
                  radius: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cartItems.title),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        cartItems.price.toString(),
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
      Positioned(
          top: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity(0.5),
            child: IconButton(
              onPressed:onPressed,
              icon: Icon(
                Icons.close,
                color: Color.fromARGB(255, 255, 85, 0),
              ),
            ),
            radius: 15,
          ))
    ]);
  }
}
