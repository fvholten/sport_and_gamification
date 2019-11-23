import 'package:flutter/material.dart';
import 'package:sport_and_gamification_app/model/model.dart';
import 'package:sport_and_gamification_app/profile/account_info.dart';

class ProfilePage extends StatefulWidget {

  ProfilePage({this.player});

  Player player;

  @override
  State<StatefulWidget> createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return AccountInfo(player: widget.player);
  }
}
