import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repository/repository.dart';
import 'package:sport_and_gamification/app/services/model_provider.dart';
import 'package:sport_and_gamification/common/loading_screen.dart';
import 'package:sport_and_gamification/login/login_screen.dart';
import 'package:sport_and_gamification/services/authentication_gate.dart';
import 'package:sport_and_gamification/theme/style.dart';
import 'package:user_repository/user_repository.dart';

import 'app/app_screen.dart';
import 'app/services/navigation_provider.dart';
import 'services/authentication_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final UserRepository userRepository = UserRepository();
  final AuthenticationGate authenticationGate = AuthenticationGate();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthenticationGate>(
        create: (_) => authenticationGate),
    ChangeNotifierProvider<AuthenticationProvider>(
        create: (_) => AuthenticationProvider(
            userRepository: userRepository, authGate: authenticationGate)),
  ], child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget currentWidget;

    return MaterialApp(
      title: 'Sport and Gamification',
      theme: appTheme(),
      home: SplashScreen.navigate(
        name: 'assets/splash_intro.flr',
        next: (context) =>
            Consumer<AuthenticationGate>(builder: ((context, gate, child) {
          AuthenticationProvider auth =
              Provider.of<AuthenticationProvider>(context, listen: false);
          if (AuthState.uninitialized == gate.state) {
            auth.isSignedIn();
            if (!(currentWidget is LoadingScreen)) {
              currentWidget = LoadingScreen();
            }
          } else if (AuthState.unauthenticated == gate.state ||
              AuthState.loggedOut == gate.state &&
                  !(currentWidget is LoginScreen)) {
            currentWidget = LoginScreen();
          } else if (AuthState.loggedIn == gate.state) {
            currentWidget = MultiProvider(providers: [
              ChangeNotifierProvider<NavigationProvider>(
                create: (_) => NavigationProvider(),
              ),
              ChangeNotifierProvider<ModelProvider>(
                create: (_) => ModelProvider()
                  ..loadPlayer(new FirebasePlayerRepository(), auth.user.uid),
              )
            ], child: AppScreen());
          }
          return currentWidget;
        })),
        until: () => Future.delayed(Duration(seconds: 1, milliseconds: 30)),
        backgroundColor: Colors.white,
        startAnimation: 'intro',
      ),
    );
  }
}
