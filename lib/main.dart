import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_and_gamification/simple_bloc_delegate.dart';
import 'package:sport_and_gamification/theme/style.dart';
import 'package:user_repository/user_repository.dart';

import 'app/app_screen.dart';
import 'app/bloc/bloc.dart';
import 'authentication_bloc/bloc.dart';
import 'login/login.dart';
import 'splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          builder: (context) => NavigationBloc(),
        ),
        BlocProvider<PlayerBloc>(
          builder: (context) => PlayerBloc(),
        ),
        BlocProvider<AuthenticationBloc>(
            builder: (context) =>
                AuthenticationBloc(userRepository: userRepository)
                  ..add(AppStarted()))
      ],
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport and Gamification',
      theme: appTheme(),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Unauthenticated) {
            return LoginScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            return AppScreen(
              userRepository: _userRepository,
            );
          }
          return SplashScreen();
        },
      ),
    );
  }
}
