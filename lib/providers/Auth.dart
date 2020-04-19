import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';
import '../utils/ErrorCodes.dart';

enum ViewState { Idle, Busy }

class Auth extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  bool get isLoading => _state == ViewState.Busy;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  final utils = Utils();
  final errorCodes = ErrorCodes();
  Future<String> login(String accountNumber, String userName, String password) async {
    setState(ViewState.Busy);
    final prefs = await SharedPreferences.getInstance();
    final url =
        '${utils.baseUrl}?clientCode=$accountNumber&username=$userName&password=$password&request=verifyUser';
    final response = await http.get(url);
    final data = json.decode(response.body);
    final dataStatus = data['status'];
    if (dataStatus['responseStatus'] == 'error') {
      setState(ViewState.Idle);

      final error = errorCodes.errorMessage[dataStatus['errorCode']];
      return error;
    }
    final sessionKey = data["records"][0]['sessionKey'];
    final Map<String, String> userData = {
      'accountNumber': accountNumber,
      'userName': userName,
      'password': password,
      'sessionKey': sessionKey
    };
    prefs.setString('userData', json.encode(userData));
    setState(ViewState.Idle);
    notifyListeners();
    return 'success';
  }
}
