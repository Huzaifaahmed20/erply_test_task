import 'package:flutter/material.dart';
//providers
import '../providers/Auth.dart';
//eidgets
import './TextInput.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController accountNoController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function onPressHandler;
  final Auth auth;

  const LoginForm({
    @required this.accountNoController,
    @required this.usernameController,
    @required this.passwordController,
    @required this.onPressHandler,
    @required this.auth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextInput(
          inputController: accountNoController,
          inputLabel: 'Accont Number',
          inputIcon: Icon(Icons.account_box),
          inputType: TextInputType.number,
        ),
        TextInput(
          inputController: usernameController,
          inputLabel: 'Username',
          inputIcon: Icon(Icons.person_outline),
          inputType: TextInputType.text,
        ),
        TextInput(
          inputController: passwordController,
          inputLabel: 'Password',
          inputIcon: Icon(Icons.lock_outline),
          inputType: TextInputType.visiblePassword,
          isObsecureText: true,
        ),
        Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: RaisedButton.icon(
              color: Colors.purpleAccent,
              textColor: Colors.white,
              onPressed: auth.isLoading ? null : onPressHandler,
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              label: auth.isLoading
                  ? CircularProgressIndicator(backgroundColor: Colors.white)
                  : Text('Login'),
            ),
          ),
        )
      ],
    );
  }
}
