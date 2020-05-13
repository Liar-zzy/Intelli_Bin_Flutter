import 'package:flutter/material.dart';
import '../pages/helperPage/helperPage.dart';
import '../pages/homePage/homePage.dart';
import '../pages/myPage/myPage.dart';

class TabWidget extends StatefulWidget {
  TabWidget({Key key, this.currentIndex = 0}) : super(key: key);

  int currentIndex = 0;

  @override
  _TabWidgetState createState() => _TabWidgetState(currentIndex: currentIndex);
}

class _TabWidgetState extends State<TabWidget> {
  int _currentIndex = 0;
  List<Widget> list = new List();

  _TabWidgetState({int currentIndex = 0}) {
    _currentIndex = currentIndex;
  }

  @override
  void initState() {
    list.add(HomePage());
    list.add(HelperPage());
    list.add(MyPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //unselectedItemColor: Colors.black,
        //selectedItemColor: Colors.red[100],
        iconSize: 22,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            title: Text('主页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            activeIcon: Icon(Icons.library_books),
            title: Text('使用教程'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            title: Text('我的'),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) async {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
