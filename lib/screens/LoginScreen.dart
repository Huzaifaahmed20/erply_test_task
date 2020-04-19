import 'dart:io';
import 'package:erply_test_task/widgets/ShowAlert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//screens
import '../screens/ProductsScreen.dart';
// providers
import '../providers/Auth.dart';
//widgets
import '../widgets/LoginForm.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    void _onLogin() async {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (_accountNoController.text.isNotEmpty ||
            _usernameController.text.isNotEmpty ||
            _passwordController.text.isNotEmpty) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            final response = await auth.login(
              _accountNoController.text,
              _usernameController.text,
              _passwordController.text,
            );
            if (response != 'success') {
              showAlert(context, 'Error', response);
              return;
            }
            Navigator.of(context).pushReplacementNamed(ProductsScreen.routeName);
          }
        } else {
          showAlert(context, 'Alert', 'Fields cannot be empty');
          return;
        }
      } on SocketException catch (_) {
        showAlert(context, 'Error', 'You\'re not connected to internet');
        return;
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Erply'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: LoginForm(
              accountNoController: _accountNoController,
              usernameController: _usernameController,
              passwordController: _passwordController,
              onPressHandler: _onLogin,
              auth: auth,
            ),
          ),
        ));
  }
}
