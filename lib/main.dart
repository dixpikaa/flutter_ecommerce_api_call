import 'package:apifetch/data_layer/repository/product_repo.dart';
import 'package:apifetch/presentation/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => ProductRepository(),
        child:  HomeScreen(),
      ),
    );
  }
}
