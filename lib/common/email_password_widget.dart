import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'email_password.dart';

class EmailPasswordWidget extends StatefulWidget {
  @override
  _EmailPasswordWidgetState createState() => _EmailPasswordWidgetState();
}

class _EmailPasswordWidgetState extends State<EmailPasswordWidget> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController()
      ..addListener(() => _onEmailChanged());
    _passwordController = TextEditingController()
      ..addListener(() => _onPasswordChanged());
  }

  void _onEmailChanged() {
    setState(() {
      Provider.of<EmailPassword>(context, listen: false).email =
          _emailController.text;
    });
  }

  void _onPasswordChanged() {
    setState(() {
      Provider.of<EmailPassword>(context, listen: false).password =
          _passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailPassword>(
      builder: (c, emailPass, child) => Column(
        children: <Widget>[
          TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
              ),
              autovalidate: true,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              validator: (_) {
                return !emailPass.isEmailValid() ? 'Invalid Email' : null;
              }),
          TextFormField(
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            obscureText: true,
            autovalidate: true,
            autocorrect: false,
            validator: (_) {
              return !emailPass.isPasswordValid() ? 'Invalid Password' : null;
            },
          ),
        ],
      ),
    );
  }
}
