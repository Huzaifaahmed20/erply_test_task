import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final product;
  const ProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        backgroundImage: NetworkImage(
          product['images'] == null
              ? 'https://icons.iconarchive.com/icons/iconsmind/outline/512/Shopping-Cart-icon.png'
              : product['images'][0]['smallURL'],
        ),
      ),
      title: Text('${product['name']}'),
      subtitle: Text('${product['description']}'),
    );
  }
}
