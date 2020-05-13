import 'package:flutter/material.dart';
import 'package:intelli_bin/pages/homePage/HomePageBody.dart';
import 'SearchBarDelegate.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2171F5),
                Color(0xFF49A2FC),
              ],
            ),
          ),
        ),
        leading: Icon(Icons.search),
        centerTitle: true,
        title: new Container(
          //标题搜索框
          child: new RaisedButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchBarDelegate());
            },
            color: Colors.white,
            child: new Text(
              "请输入垃圾物品名称",
              style: new TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      body: HomePageBody(),
    );
  }
}
