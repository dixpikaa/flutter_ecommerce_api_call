import 'package:apifetch/domain/models/product_model.dart';
import 'package:apifetch/presentation/screen/home/bloc/home_bloc.dart';
import 'package:apifetch/presentation/screen/home/cart_screen.dart';
import 'package:apifetch/presentation/screen/widgets/wishlistscreen.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel product;
  final HomeBloc homeBloc;
 

  const ProductTileWidget({super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration:const  BoxDecoration(
      ),
      padding:const EdgeInsets.only(top: 30,left: 30,right: 30),
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: Container(
         height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Colors.blue.withOpacity(0.2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              height: MediaQuery.of(context).size.height * 0.3,
              image: NetworkImage(
                product.image,
              ),
            ),
            Text(product.title),
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>WishListScreen()));
                }, icon:Icon(Icons.favorite,color:Color.fromARGB(255, 255, 85, 0),size: 30,)),
                  const SizedBox(width:20),
                Text(product.price.toString()),
                const SizedBox(width:20),
                ElevatedButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 255, 85, 0))),
                  onPressed: (){
                    homeBloc.add(ProductCartEvent(product));
                  }, child:const Text("Add to cart"))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
