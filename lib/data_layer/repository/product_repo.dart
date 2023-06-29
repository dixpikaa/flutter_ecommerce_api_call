import 'dart:convert';

import 'package:apifetch/domain/models/product_model.dart';
import 'package:http/http.dart';

class ProductRepository {
  String endpoint = 'https://fakestoreapi.com/products';

  Future<List<ProductDataModel>> getProduct() async {
    Response response = await get(Uri.parse(endpoint));
  
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map(((e) => ProductDataModel.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
