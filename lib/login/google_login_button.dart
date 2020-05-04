import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sport_and_gamification/services/authentication_provider.dart';

class GoogleLoginButton extends StatelessWidget {

  AuthenticationProvider _auth;

  GoogleLoginButton(AuthenticationProvider auth) : _auth = auth;

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(FontAwesomeIcons.google, color: Colors.white),
      onPressed: () {
        _auth.signInWithGoogle();
      },
      label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
      color: Colors.redAccent,
    );
  }
}
