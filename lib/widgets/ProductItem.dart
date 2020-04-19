import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final product;
  const ProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    List productImages = product['images'];
    const placeHolderImage =
        'https://icons.iconarchive.com/icons/iconsmind/outline/512/Shopping-Cart-icon.png';
    return Card(
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30,
            backgroundImage: NetworkImage(
              product['images'] == null ? placeHolderImage : product['images'][0]['smallURL'],
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
          subtitle: SizedBox(
            height: productImages != null ? 100 : 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${product['description']}'),
                productImages != null
                    ? Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: productImages.map((item) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: FadeInImage.assetNetwork(
                                placeholder: placeHolderImage,
                                image: item['smallURL'],
                                fit: BoxFit.fill,
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    : Text('No images found')
              ],
            ),
          )),
    );
  }
}
