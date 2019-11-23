import 'package:flutter/material.dart';
import 'package:sport_and_gamification_app/widget/account_info.dart';
import 'package:sport_and_gamification_domain/domain.dart';

class MyProfilePage extends StatefulWidget {

  MyProfilePage({this.player});

  Player player;

  @override
  State<StatefulWidget> createState() => new _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {

  @override
  Widget build(BuildContext context) {
    return AccountInfo(player: widget.player);
  }
}
