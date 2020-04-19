import 'dart:convert';
import 'package:erply_test_task/providers/Auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../models/ProductModel.dart';
import '../utils/utils.dart';

class Products extends ChangeNotifier {
  List<Product> loadedProducts = [];
  bool isAuth = true;

  void setAuth(bool value) {
    isAuth = value;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    List<int> sessionExpiredCodes = [1054, 1055, 1056];
    final utils = Utils();
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData = prefs.getString('userData') != null
        ? json.decode(prefs.getString('userData')) as Map<String, Object>
        : null;
    if (extractedUserData == null) {
      setAuth(false);
      return;
    }
    final sessionKey = extractedUserData['sessionKey'];
    final accountNumber = extractedUserData['accountNumber'];
    final userName = extractedUserData['userName'];
    final password = extractedUserData['password'];

    final url =
        '${utils.baseUrl}?clientCode=$accountNumber&request=getProducts&sessionKey=$sessionKey';
    final response = await http.get(url);
    final data = json.decode(response.body);
    final dataStatus = data['status'];
    if (dataStatus['responseStatus'] == 'error') {
      final isSessionExpired = sessionExpiredCodes.contains(dataStatus['errorCode']);
      if (isSessionExpired) {
        final loginResponse = await Auth().login(accountNumber, userName, password);
        if (loginResponse == 'success') {
          return await fetchProducts();
        }
      } else {
        setAuth(false);
        return;
      }
    }
    return data['records'];
  }
}
