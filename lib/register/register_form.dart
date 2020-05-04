import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_and_gamification/common/email_password.dart';
import 'package:sport_and_gamification/common/email_password_widget.dart';
import 'package:sport_and_gamification/common/loading_indecator.dart';
import 'package:sport_and_gamification/register/register_button.dart';
import 'package:sport_and_gamification/services/authentication_provider.dart';

class RegisterFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthenticationProvider, EmailPassword>(
        builder: (context, auth, emailPass, child) {
      if (auth.registerState == RegisterState.loading) {
        return LoadingIndicator();
      }
      if (auth.registerState == RegisterState.success) {
        auth.isSignedIn();
        Navigator.of(context).pop();
      }
      return Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: ListView(
              children: <Widget>[
                EmailPasswordWidget(),
                (auth.registerState == RegisterState.failed)
                    ? Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Registration Failed!'),
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      )
                    ],
                  ),
                )
                    : Container(),
                RegisterButton(
                  onPressed: _isLoginButtonEnabled(auth, emailPass)
                      ? () => auth.signUp(
                            emailPass.email,
                            emailPass.password,
                          )
                      : null,
                ),
              ],
            ),
          ));
    });
  }

  bool _isLoginButtonEnabled(
      AuthenticationProvider auth, EmailPassword emailPassword) {
    return emailPassword.isValid() &&
        auth.registerState != RegisterState.loading;
  }
}
