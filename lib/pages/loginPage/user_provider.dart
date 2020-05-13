import 'package:flutter/material.dart';
import '../../model/user.dart';

class UserProvider extends InheritedWidget {
  final Widget child;
  final User user; //在子树中共享的数据

  UserProvider({this.user, this.child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class UserContainer extends StatefulWidget {
  //给子控件分享的数据
  final User user;
  final Widget child;

  UserContainer({Key key, this.user, this.child}) : super(key: key);

  @override
  _UserContainerState createState() => _UserContainerState();

  static UserProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(UserProvider);
  }
}

class _UserContainerState extends State<UserContainer> {
  @override
  Widget build(BuildContext context) {
    return new UserProvider(user: widget.user, child: widget.child);
  }
}
