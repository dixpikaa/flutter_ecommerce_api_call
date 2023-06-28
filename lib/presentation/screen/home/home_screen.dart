import 'package:apifetch/data_layer/repository/product_repo.dart';
import 'package:apifetch/domain/models/product_model.dart';
import 'package:apifetch/presentation/screen/home/bloc/home_bloc.dart';
import 'package:apifetch/presentation/screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<ProductRepository>(context),
      )..add(LoadProductEvent()),
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ProductLoadedState) {
              List<ProductDataModel> productList = state.products;
              return ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductTileWidget(product: productList[index]);
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
