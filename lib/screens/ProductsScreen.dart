import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/Products.dart';
import '../widgets/ProductItem.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/products-screen';
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: product.fetchProducts(),
          builder: (context, snapshot) {
            List products = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: products.length,
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductItem(product: products[index]),
              ),
            );
          }),
    );
  }
}
