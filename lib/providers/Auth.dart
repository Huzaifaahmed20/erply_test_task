import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

enum ViewState { Idle, Busy }

class Auth extends ChangeNotifier {
  final utils = Utils();
  Future<void> login(
      String accountNumber, String userName, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final url =
        '${utils.baseUrl}?clientCode=$accountNumber&username=$userName&password=$password&request=verifyUser';
    final response = await http.get(url);
    final data = json.decode(response.body);
    final sessionKey = data["records"][0]['sessionKey'];
    prefs.setString('sessionKey', sessionKey);
    notifyListeners();
  }
}
