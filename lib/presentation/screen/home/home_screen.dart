import 'package:apifetch/data_layer/repository/product_repo.dart';
import 'package:apifetch/domain/models/product_model.dart';
import 'package:apifetch/presentation/screen/home/bloc/home_bloc.dart';
import 'package:apifetch/presentation/screen/widgets/search_area.dart';
import 'package:apifetch/presentation/screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc(RepositoryProvider.of(context));
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<ProductRepository>(context),
      )..add(LoadProductEvent()),
      child: Scaffold(
        body: Container(
            child: Column(
              children: [
                SearchAreaWidget(),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is ProductLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductLoadedState) {
                      List<ProductDataModel> productList = state.products;
                      return Expanded(
                        child: GridView.builder(
                          itemCount: productList.length,
                          gridDelegate:
                         const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemBuilder: ( context,  index) {
                         
                        
                                
                          return  ProductTileWidget(product: productList[index], homeBloc: homeBloc );}
                          
                        ),
                      );
                    }
                    return SizedBox(
                    );
                  },
                ),
              ],
            ),
          ),
      ),
    );
  }
}
