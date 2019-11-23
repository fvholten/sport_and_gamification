import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport_and_gamification_domain/domain.dart';

class AccountInfo extends StatelessWidget {

  AccountInfo({this.player});

  Player player;

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: <Widget>[
            Text(
              "Name",
              style: Theme.of(context).textTheme.headline,
            ),
            Text(player.name)
          ],
        ),
        TableRow(
          children: [
            Text(
              "Description",
              style: Theme.of(context).textTheme.headline,
            ),
            Text(player.description)
          ],
        ),
        TableRow(children: [
          Text(
            "History",
            style: Theme.of(context).textTheme.headline,
          ),
          Text(player.history)
        ])
      ],
    );
  }
}

