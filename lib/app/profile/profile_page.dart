import 'package:flutter/material.dart';
import 'package:repository/repository.dart';

import 'account_info.dart';

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
