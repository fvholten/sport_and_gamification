import 'package:flutter/material.dart';
import 'package:sport_and_gamification/common/common.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Logo(),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: LinearProgressIndicator(),
          ),
          Center(
            child: Text(
              "Loading...",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .apply(color: Colors.white),
            ),
          )
        ],
      )),
    );
  }
}
