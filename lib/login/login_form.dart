import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_and_gamification/common/email_password.dart';
import 'package:sport_and_gamification/common/email_password_widget.dart';
import 'package:sport_and_gamification/common/loading_indecator.dart';
import 'package:sport_and_gamification/common/logo.dart';
import 'package:sport_and_gamification/login/google_login_button.dart';
import 'package:sport_and_gamification/services/authentication_provider.dart';

import 'create_account_button.dart';
import 'login_button.dart';

class LoginFormWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey;

  LoginFormWidget(GlobalKey<ScaffoldState> scaffoldKey)
      : _scaffoldKey = scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Consumer2<EmailPassword, AuthenticationProvider>(
        builder: (context, emailPass, auth, child) {
      if (auth.loginState == LoginState.loading) {
        return Center(
          child: LoadingIndicator(),
        );
      }
      return Padding(
          padding: EdgeInsets.all(20.0),
          child: Form(
              child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Logo(),
              ),
              EmailPasswordWidget(),
              (auth.loginState == LoginState.failed)
                  ? Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Login Failed!'), Icon(Icons.error, color: Colors.red,)],
                      ),
                  )
                  : Container(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    LoginButton(
                      onPressed: isLoginButtonEnabled(auth, emailPass)
                          ? () => auth.loginWithCredentials(
                              email: emailPass.email,
                              password: emailPass.password)
                          : null,
                    ),
                    GoogleLoginButton(auth),
                    CreateAccountButton(),
                  ],
                ),
              ),
            ],
          )));
    });
  }

  bool isLoginButtonEnabled(
      AuthenticationProvider auth, EmailPassword emailPassword) {
    return emailPassword.isValid() && auth.loginState != LoginState.loading;
  }
}
