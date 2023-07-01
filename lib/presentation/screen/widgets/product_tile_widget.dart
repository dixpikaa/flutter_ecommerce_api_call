import 'package:apifetch/domain/models/product_model.dart';
import 'package:apifetch/presentation/screen/home/bloc/home_bloc.dart';
import 'package:apifetch/presentation/screen/home/details_page.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel product;
  final HomeBloc homeBloc;

  const ProductTileWidget(
      {super.key, required this.product, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 223, 220, 220),
      ),
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetailsPage(product: product, homeBloc: homeBloc,)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.blue)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.blue,
                          size: 30,
                        )),
                  )),
              Image(
                height: MediaQuery.of(context).size.height * 0.16,
                image: NetworkImage(
                  product.image,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 10),
                child: Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.green),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      "\$ ${product.price.toString()}",
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.lightBlue,
                          ),
                        ),
                        onPressed: () {
                          homeBloc.add(ProductCartEvent(product));
                        },
                        child: const Text("Add to cart"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
