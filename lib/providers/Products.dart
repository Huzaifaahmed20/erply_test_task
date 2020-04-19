import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/ProductModel.dart';
import '../utils/utils.dart';

class Products extends ChangeNotifier {
  List<Product> loadedProducts = [];
  Future<void> fetchProducts() async {
    final utils = Utils();
    final prefs = await SharedPreferences.getInstance();
    final sessionKey = prefs.getString('sessionKey');
    final url =
        '${utils.baseUrl}?clientCode=${utils.accountNumber}&request=getProducts&sessionKey=$sessionKey';
    final response = await http.get(url);
    final data = json.decode(response.body);
    // data['records'].forEach((index, product) {
    //   loadedProducts.add(Product(
    //     name: product['name'],
    //     description: product['description'],
    //     price: product['price'],
    //     images: product['images'],
    //   ));
    // });
    // print(loadedProducts);
    notifyListeners();
    return data['records'];
  }
}
