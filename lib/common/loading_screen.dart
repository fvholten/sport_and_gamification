import 'package:flutter/material.dart';

import 'logo.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
          )
        ],
      )),
    );
  }
}
