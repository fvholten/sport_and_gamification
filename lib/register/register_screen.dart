import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_and_gamification/common/email_password.dart';
import 'package:sport_and_gamification/register/register_form.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: ChangeNotifierProvider(
            create: (context) => EmailPassword(),
            child: RegisterFormWidget()
        ),
      ),
    );
  }
}
