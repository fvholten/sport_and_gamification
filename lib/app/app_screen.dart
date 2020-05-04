import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_and_gamification/app/create_user/create_user_page.dart';
import 'package:sport_and_gamification/app/home/home.dart';
import 'package:sport_and_gamification/app/profile/profile.dart';
import 'package:sport_and_gamification/app/services/model_provider.dart';
import 'package:sport_and_gamification/app/services/navigation_provider.dart';
import 'package:sport_and_gamification/common/loading_screen.dart';
import 'package:sport_and_gamification/services/authentication_provider.dart';

enum Options { logout }

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildAppScreen(context);
  }

  Scaffold buildAppScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sport und Gamification'), actions: <Widget>[
        PopupMenuButton<Options>(
            onSelected: (Options result) {
              if (result == Options.logout) {
                Provider.of<AuthenticationProvider>(context, listen: false)
                    .signOut();
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
                  PopupMenuItem(
                    value: Options.logout,
                    child: Text('Logout'),
                  ),
                ]),
      ]),
      body: Consumer<ModelProvider>(builder: (context, model, child) {
        if (model.loading) {
          return LoadingScreen();
        } else if (model.player == null) {
          return CreateUserPage();
        } else {
          return Consumer<NavigationProvider>(builder: (context, nav, child) {
            if (nav.state == NavigationState.Home) {
              return HomePage();
            } else if (nav.state == NavigationState.Profile) {
              return ProfilePage();
            }
            return LoadingScreen();
          });
        }
      }),
      bottomNavigationBar:
          Consumer<ModelProvider>(builder: (context, model, child) {
        if (model.loading || model.player == null) {
          return Container(width: 0.0, height: 0.0);
        } else {
          return Consumer<NavigationProvider>(builder: (context, nav, child) {
            return BottomNavigationBar(
              currentIndex: nav.index,
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
                if (index != nav.index) {
                  if (index == 0) nav.state = NavigationState.Home;
                  if (index == 1) nav.state = NavigationState.Profile;
                }
              },
            );
          });
        }
      }),
    );
  }
}
