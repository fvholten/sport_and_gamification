import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
      );
}
