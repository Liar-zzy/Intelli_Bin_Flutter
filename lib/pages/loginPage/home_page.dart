import 'package:flutter/material.dart';
import 'package:intelli_bin/components/tab.dart';
import '../../model/user.dart';
import 'user_provider.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User user = UserContainer.of(context).user;
    if (user == null) {
      return new LoginPage();
    } else {
      return new TabWidget();
    }
  }
}
