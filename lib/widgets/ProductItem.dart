import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final product;
  const ProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          product['images'] == null
              ? 'https://www.freepnglogos.com/uploads/shopping-cart-png/shopping-cart-svg-png-icon-download-28.png'
              : product['images'][0]['smallURL'],
          scale: 5.0,
        ),
      ),
      title: Text('${product['name']}'),
    );
  }
}
