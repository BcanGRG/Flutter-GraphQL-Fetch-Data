import 'package:flutter/material.dart';
import 'package:graphql_basic/features/products/view/product_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ProductView(),
    );
  }
}
