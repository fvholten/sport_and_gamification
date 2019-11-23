import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_and_gamification_app/authentication_bloc/bloc.dart';
import 'package:sport_and_gamification_app/create_user/create_user_page.dart';
import 'package:sport_and_gamification_app/model/model.dart';
import 'package:sport_and_gamification_app/profile/profile.dart';
import 'package:user_repository/user_repository.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.userRepository}) : super(key: key);
  UserRepository userRepository;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static Player _player = Player()
    ..name = ""
    ..description = ""
    ..history = "";

  @override
  void initState() {
    super.initState();
    createPlayer();
  }

  void createPlayer() {
    widget.userRepository.getUser().then((user) {
      Firestore.instance
          .collection('players')
          .document(user.uid)
          .get()
          .then((snapshot) {
        if (snapshot != null && !snapshot.exists) {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CreateUserPage(id: user.uid, email: user.email)))
              .then((_x) {
            createPlayer();
          });
        } else {
          print(snapshot);
          setState(() {
            _player = Player.fromJson(snapshot.data);
          });
        }
      }).catchError((error) => print(error.toString()));
    });
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
    new ProfilePage(player: _player),
  ];

  _signOut() async {
    BlocProvider.of<AuthenticationBloc>(context).add(
      LoggedOut(),
    );
  }
}
