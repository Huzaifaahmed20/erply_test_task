import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//screens
import '../screens/ProductsScreen.dart';
// providers
import '../providers/Auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _onLogin() async {
      final auth = Provider.of<Auth>(context, listen: false);
      await auth.login(
        _accountNoController.text,
        _usernameController.text,
        _passwordController.text,
      );
      Navigator.of(context).pushReplacementNamed(ProductsScreen.routeName);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Erply'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _accountNoController,
                  decoration: InputDecoration(
                    labelText: 'Account Number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_box),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
              ),
              Container(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RaisedButton.icon(
                    color: Colors.purpleAccent,
                    textColor: Colors.white,
                    onPressed: _onLogin,
                    icon: Icon(Icons.arrow_forward, color: Colors.white),
                    label: Text('Login'),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
