import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data_layer/repository/product_repo.dart';
import '../../../domain/models/product_model.dart';
import '../home/bloc/home_bloc.dart';

class YouMayLikeWidget extends StatelessWidget {
  final HomeBloc homeBloc;
  const YouMayLikeWidget({super.key, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc..add(LoadProductEvent()),
      child: Padding(
        padding: const EdgeInsets.only(top: 26),
        child: Column(children: [
          Text(
            "You May like",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if(state is ProductLoadingState){
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductLoadedState) {

              print("Item get length  : ${state.products.length}");
              return _buildSuggestProduct(state.products);
            }
            return SizedBox();
          })
        ]),
      ),
    );
  }

  Expanded _buildSuggestProduct(List<ProductDataModel> products) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.6),
        itemBuilder: (context, index) {

          final product  = products[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              child: Column(
                children: [
                  Image(height: 70, image: NetworkImage(product.image)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View Description",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
