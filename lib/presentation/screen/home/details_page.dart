import 'package:apifetch/domain/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data_layer/repository/product_repo.dart';
import '../widgets/show similar product.dart';
import 'bloc/home_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductDataModel product;
  const ProductDetailsPage(
      {super.key, required this.product});
  @override
  Widget build(BuildContext context) {

    final homeBloc = HomeBloc(
        RepositoryProvider.of<ProductRepository>(context),
      ); 
    return BlocProvider(
      create: (context) =>homeBloc..add(LoadProductEvent()),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                // height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black38),
                          child: Text(
                            product.category,
                            style: TextStyle(color: Colors.white),
                          ))),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                        height: MediaQuery.of(context).size.height * 0.35,
                        image: NetworkImage(product.image)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Column(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            product.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              product.description,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Rate",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      "(${product.rating.rate.toString()})",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Count",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 17),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  product.rating.count.toString(),
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "\$ ${product.price.toString()}",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w600),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                Colors.black,
                              )),
                              onPressed: () {
                                homeBloc.add(ProductCartEvent(product));
                              },
                              child: Text("Add to cart"),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ),
                  YouMayLikeWidget(homeBloc: homeBloc,),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
