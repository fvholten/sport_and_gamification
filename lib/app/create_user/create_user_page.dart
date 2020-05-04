import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:repository/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sport_and_gamification/app/profile/account_info.dart';
import 'package:sport_and_gamification/app/services/navigation_provider.dart';
import 'package:sport_and_gamification/services/authentication_provider.dart';

class CreateUserPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() =>
      new _CreateUserState();
}

class _CreateUserState extends State<CreateUserPage> {

  final Firestore db = Firestore.instance;

  Player player = new Player()
    ..name = ""
    ..description = ""
    ..history = "";

  PageController _pageController = PageController(viewportFraction: 1);

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
                  'Hi!',
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
                ),
              ],
            ),
            false, context),
        makePage(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Wellcome ${player.name}. Describe yourself:',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
                  child: TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        setState(() {
                          player.description = value;
                        });
                      },
                      maxLines: 10,
                      maxLength: 500,
                      autofocus: false),
                )
              ],
            ),
            false, context),
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
                      onChanged: (value) {
                        setState(() {
                          player.history = value;
                        });
                      },
                      maxLines: 10,
                      maxLength: 500,
                      autofocus: false),
                )
              ],
            ),
            false, context),
        makePage(
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: AccountInfo()
              ),
            ),
            true, context)
      ],
    ));
  }

  int fabCount = 0;

  Widget makePage(Widget content, bool isLast, BuildContext context) {
    fabCount++;
    return new Scaffold(
      body: content,
      floatingActionButton: new FloatingActionButton(
        heroTag: 'FAB$fabCount',
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
    AuthenticationProvider auth = Provider.of<AuthenticationProvider>(context, listen: false);

    player.id = auth.user.uid;
    player.email = auth.user.email;
    player.image = auth.user.photoUrl;
    print(player.toJson());
    db.collection('players').document(auth.user.uid).setData(player.toJson()).then((_x) {
      Provider.of<NavigationProvider>(context).state = NavigationState.Home;
    });
  }

  void nextPage() {
    _pageController.animateToPage(_pageController.page.toInt() + 1,
        curve: Curves.easeInOut, duration: Duration(milliseconds: 500));
  }
}
