import 'package:flutter/material.dart';
import 'package:apifetch/domain/models/product_model.dart';

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
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                spreadRadius: 1,
              
              )]),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image(
                    height: 180,
                    width: 100,
                    image: NetworkImage(cartItems.image),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          cartItems.title,
                          style: TextStyle(fontSize: 17),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        cartItems.price.toString(),
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(spreadRadius: 2, color: Colors.grey)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            Text("count"),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.remove))
                          ],
                        ),
                      )
                    ])
              ],
            ),
          ),
        ),
      ),
      Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 35,width: 35,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.lightBlue),
            child: Center(
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ))
    ]);
  }
}
