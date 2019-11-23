import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sport_and_gamification_app/pages/create_user_page.dart';
import 'package:sport_and_gamification_app/pages/my_profile_page.dart';
import 'package:sport_and_gamification_app/services/authentication.dart';
import 'package:sport_and_gamification_domain/domain.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static Player _player = Player()..name = ""..description = ""..history = "";

  @override
  void initState() {
    super.initState();
    createPlayer();
  }

  void createPlayer() {
    print('userId:' + widget.userId);
    Firestore.instance
        .collection('players')
        .document(widget.userId)
        .get()
        .then((snapshot) {
      if (snapshot != null && !snapshot.exists) {
        widget.auth.getCurrentUser().then((user) {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateUserPage(id: user.uid, email: user.email)))
              .then((_x) {
            createPlayer();
          });
        });
      } else {
        print(snapshot);
        setState(() {
          _player.name = snapshot.data['name'];
          _player.description = snapshot.data['description'];
          _player.history = snapshot.data['history'];
        });
      }
    }).catchError((error) => print(error.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sport and Gamification'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Logout',
                style: new TextStyle(fontSize: 19.0, color: Colors.white)),
            onPressed: _signOut,
          )
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    Container(),
    new MyProfilePage(player: _player),
  ];

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
}
