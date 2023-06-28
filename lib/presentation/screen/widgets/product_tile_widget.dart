import 'package:apifetch/domain/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel product;

  const ProductTileWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            // image
            ),
        Text(product.title)
      ],
    );
  }
}
