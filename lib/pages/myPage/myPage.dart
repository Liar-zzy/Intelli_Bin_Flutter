import 'package:flutter/material.dart';
import 'package:intelli_bin/pages/myPage/profile_header.dart';

import 'main_menu.dart';
import 'models.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ProfileHomePage(),
      ),
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = getProfile();

    return new Scaffold(
      body: new ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          new ProfileHeader(profile),
          new MainMenu(),
        ],
      ),
    );
  }
}
