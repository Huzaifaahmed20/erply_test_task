import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final product;
  const ProductItem({@required this.product});

  @override
  Widget build(BuildContext context) {
    List productImages = product['images'];
    const placeHolderImage =
        'https://wolper.com.au/wp-content/uploads/2017/10/image-placeholder.jpg';
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
            height: productImages != null ? 100 : 70,
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
                                placeholder: 'assets/images/cart.png',
                                image: item['smallURL'],
                                height: 100,
                                width: 100,
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
