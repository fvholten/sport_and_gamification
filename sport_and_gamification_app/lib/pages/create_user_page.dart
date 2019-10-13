import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport_and_gamification_domain/domain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateUserPage extends StatefulWidget {
  CreateUserPage({this.id, this.email});

  final String id;
  final String email;

  @override
  State<StatefulWidget> createState() =>
      new _CreateUserState(id: id, email: email);
}

class _CreateUserState extends State<CreateUserPage> {
  _CreateUserState({this.id, this.email});

  final String id;
  final String email;

  final Firestore db = Firestore.instance;

  Player player = new Player()..name = "";
  
  PageController _pageController = PageController(viewportFraction: 0.9);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical,
      controller: _pageController,
      children: <Widget>[
        makePage(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hi!\nTODO',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'What is your Name?',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                  child: TextField(
                      textAlign: TextAlign.center,
                      autofocus: false,
                      decoration: new InputDecoration(
                          hintText: 'Name',
                          prefixIcon: Icon(Icons.account_box)),
                      onChanged: (value) {
                        setState(() {
                          player.name = value;
                        });
                      },
                      maxLength: 35),
                )
              ],
            ),
            false),
        makePage(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Wellcome ${player.name}. Tell us about your History:',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                  child: TextField(
                      textAlign: TextAlign.center,
                      maxLines: 10,
                      maxLength: 500,
                      autofocus: false),
                )
              ],
            ),
            false),
        makePage(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tell us about your History:',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                  child: TextField(
                      textAlign: TextAlign.center,
                      maxLines: 10,
                      maxLength: 500,
                      autofocus: false),
                )
              ],
            ),
            true)
      ],
    ));
  }

  int fabCount = 0;

  Widget makePage(Widget content, bool isLast) {
    fabCount++;
    return new Scaffold(
      body: content,
      floatingActionButton: new FloatingActionButton(
        heroTag: 'FAB${fabCount}',
        child: Icon(isLast ? Icons.arrow_forward : Icons.arrow_downward),
        onPressed: () {
          if (isLast) {
            saveToFireStore();
          } else {
            nextPage();
          }
        },
      ),
    );
  }
  
  void saveToFireStore() {
    player.id = id;
    player.email = email;
    print(player.toMap());
    db.collection('players').document(id).setData(player.toMap()).then((_x) {
      Navigator.pop(context);
    });
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page.toInt() + 1,
        curve: Curves.easeInOut, duration: Duration(milliseconds: 500));
  }
}
