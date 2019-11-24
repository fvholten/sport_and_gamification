import 'model.dart';

///Nutzer der App
abstract class User implements DomainObject {
  const User({this.name, this.email, this.lastLogin});

  final String name;
  final String email;
  final DateTime lastLogin;
}
