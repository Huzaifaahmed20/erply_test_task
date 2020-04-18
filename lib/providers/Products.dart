import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../utils/utils.dart';

class Products extends ChangeNotifier {
  Future<void> fetchProducts() async {
    final utils = Utils();
    final prefs = await SharedPreferences.getInstance();
    final sessionKey = prefs.getString('sessionKey');
    final url =
        '${utils.baseUrl}?clientCode=${utils.accountNumber}&request=getProducts&sessionKey=$sessionKey';
    final response = await http.get(url);
    final data = json.decode(response.body);
    notifyListeners();
    return data['records'];
  }
}
