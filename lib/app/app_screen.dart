import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:sport_and_gamification/app/home/home.dart';
import 'package:sport_and_gamification/app/navigation_bloc/bloc.dart';
import 'package:sport_and_gamification/app/profile/profile.dart';
import 'package:sport_and_gamification/authentication_bloc/bloc.dart';
import 'package:user_repository/user_repository.dart';

enum Options { logout }

class AppScreen extends StatelessWidget {
  final UserRepository _userRepository;
  NavigationBloc _navigationBloc = NavigationBloc();

  AppScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  static Player _player = Player()
    ..name = ""
    ..description = ""
    ..history = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        bloc: _navigationBloc,
        builder: (context, state) {
          return buildAppScreen(context);
        },
      );
  }

  Scaffold buildAppScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App'), actions: <Widget>[
        PopupMenuButton<Options>(
            onSelected: (Options result) {
              if (result == Options.logout) {
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              PopupMenuItem(
                value: Options.logout,
                child: Text('Logout'),
              ),
            ]),
      ]),
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navigationBloc.state.index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('My Profile'),
          ),
        ],
        onTap: (index) {
          if (index != _navigationBloc.state.index) {
            if (index == 0) _navigationBloc.add(Home());
            if (index == 1) _navigationBloc.add(Profile());
          }
        },
      ),
    );
  }

  Widget getBody() {
    if (_navigationBloc.state is ShowHome) {
      return HomePage();
    } else if (_navigationBloc.state is ShowProfile) {
      return ProfilePage(player: _player);
    }
    return HomePage();
  }
}
