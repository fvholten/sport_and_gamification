import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_and_gamification/common/email_password.dart';
import 'package:sport_and_gamification/login/login_form.dart';


class LoginScreen extends StatelessWidget {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Login')),
      body: ChangeNotifierProvider(
        create: (context) => EmailPassword(),
        child: LoginFormWidget(_scaffoldKey),
      ),
    );
  }
}
