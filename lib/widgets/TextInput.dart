import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextEditingController inputController;
  final String inputLabel;
  final Icon inputIcon;
  final TextInputType inputType;
  final bool isObsecureText;
  const TextInput({
    @required this.inputController,
    @required this.inputLabel,
    @required this.inputIcon,
    @required this.inputType,
    this.isObsecureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        obscureText: isObsecureText,
        keyboardType: inputType,
        controller: inputController,
        decoration: InputDecoration(
          labelText: inputLabel,
          border: OutlineInputBorder(),
          prefixIcon: inputIcon,
        ),
      ),
    );
  }
}
