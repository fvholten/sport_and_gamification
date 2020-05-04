import 'package:flutter/material.dart';
import 'package:sport_and_gamification/register/register_screen.dart';
import 'package:user_repository/user_repository.dart';

class CreateAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Create an Account',
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen();
          }),
        );
      },
    );
  }
}
