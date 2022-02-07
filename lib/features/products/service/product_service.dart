import 'dart:convert';

import 'package:graphql_basic/core/network/connect_client.dart';
import 'package:graphql_basic/features/products/model/product_model.dart';
import 'package:graphql_basic/features/products/schemas/products.schemas.dart';

class ProductService {
  static Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> _list = [];
    var response = await hasuraConnect.query(ProductsSchemas.productQuery);
    var productList = response["data"]["products"]["edges"];

    if (productList is List) {
      _list = productList.map((e) => ProductModel.fromJson(e)).toList();
    }
    return _list;
  }
}
