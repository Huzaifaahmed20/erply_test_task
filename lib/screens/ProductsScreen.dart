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
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: product.fetchProducts(),
          builder: (context, snapshot) {
            List products = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text('No Products Found'),
              );
            }
            return RefreshIndicator(
              onRefresh: product.fetchProducts,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: products.length,
                itemBuilder: (_, index) => ProductItem(product: products[index]),
              ),
            );
          }),
    );
  }
}
