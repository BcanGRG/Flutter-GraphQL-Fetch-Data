import 'package:flutter/material.dart';
import 'package:graphql_basic/features/products/model/product_model.dart';
import 'package:graphql_basic/features/products/service/product_service.dart';

class ProductView extends StatefulWidget {
  ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late final Future<List<ProductModel>> futureProductList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProductList = ProductService.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    futureProductList;
    return Scaffold(
      body: FutureBuilder<List<ProductModel>>(
        future: futureProductList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> myList = snapshot.data!;
            print(myList[0]);
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2),
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  var currentProduct = myList[index].node!;
                  return Column(
                    children: [
                      Text(currentProduct.productType!.name!),
                      Container(
                        padding: EdgeInsets.all(2),
                        height: 180,
                        width: 180,
                        child: Image.network(currentProduct.thumbnail!.url!),
                      ),
                      Text(currentProduct.name!),
                    ],
                  );
                });
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
