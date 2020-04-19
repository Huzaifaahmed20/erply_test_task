import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final product;
  const ProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    print('${product['price']}');
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${product['name']}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${product['code']}',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      trailing: Text('\$${product['price']}'),
      subtitle: Text('${product['description']}'),
    );
  }
}
