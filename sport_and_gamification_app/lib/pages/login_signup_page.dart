import 'package:flutter/material.dart';
import 'package:sport_and_gamification_app/services/authentication.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({this.auth, this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Stack(
      children: <Widget>[
        _showBody(),
        _showCircularProgress(),
      ],
    ));
  }

  Widget _showBody() {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: new Form(
          key: _formKey,
          child: new ListView(
            padding: EdgeInsets.fromLTRB(16, 50, 16, 50),
            shrinkWrap: true,
            children: <Widget>[
              _showLogo(),
              const SizedBox(height: 50),
              _emailLogin(),
              const SizedBox(height: 10),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  color: Colors.black54,
                )),
                Text(' OR '),
                Expanded(
                    child: Divider(
                  color: Colors.black54,
                )),
              ]),
              const SizedBox(height: 10),
              GoogleSignInButton(
                onPressed: () => googleSignIn(),
              )
            ],
          ),
        ));
  }

  void googleSignIn() async {
    setState(() {
      _isLoading = true;
    });
    widget.auth.handleGoogleSignIn().then((user) {
      setState(() {
        _isLoading = false;
      });
      widget.onSignedIn();
    }).catchError((e) => print(e));
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _emailLogin() {
    return Column(children: <Widget>[
      _showEmailInput(),
      const SizedBox(height: 10),
      _showPasswordInput(),
      const SizedBox(height: 10),
      _showPrimaryButton(),
      _showSecondaryButton(),
      _showErrorMessage()
    ]);
  }

  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (_validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          widget.auth.sendEmailVerification();
          _showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.onSignedIn();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Widget _showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0,
      );
    }
  }

  Widget _showLogo() {
    return new Hero(
      tag: 'logo',
      child: Image.asset(
        'assets/logo.png',
        fit: BoxFit.contain,
        height: MediaQuery.of(context).size.height * 0.2,
      ),
    );
  }

  Widget _showEmailInput() {
    return new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => _email = value.trim(),
    );
  }

  Widget _showPasswordInput() {
    return TextFormField(
      maxLines: 1,
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => _password = value.trim(),
    );
  }

  Widget _showPrimaryButton() {
    return SizedBox(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      child: new RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: new Text(_isLoginForm ? 'Login' : 'Create account',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: _validateAndSubmit,
      ),
    );
  }

  Widget _showSecondaryButton() {
    return SizedBox(
        height: 35.0,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
            child: new Text(
                _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
                style:
                    new TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            onPressed: toggleFormMode));
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                toggleFormMode();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
