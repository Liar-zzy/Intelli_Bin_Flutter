import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<Widget> cardList = [
  Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(
            Icons.album,
            size: 45,
            color: Colors.red,
          ),
          title: Text(
            '打包-教程',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NotoSerifSC",
            ),
          ),
          subtitle: Text(
            '教程6',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "NotoSerifSC",
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          height: 450,
          width: 350,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <InlineSpan>[
              TextSpan(
                  text: "点击打包按钮，即可完成自动打包。",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "NotoSerifSC",
                      fontSize: 25)),
            ]),
          ),
        ),
      ],
    ),
  ),
  Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(
            Icons.album,
            size: 45,
            color: Colors.red,
          ),
          title: Text(
            '状态查看-教程',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NotoSerifSC",
            ),
          ),
          subtitle: Text(
            '教程5',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "NotoSerifSC",
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          height: 450,
          width: 350,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <InlineSpan>[
              TextSpan(
                  text: "您能看到目前机器各桶内的使用情况，方便您对垃圾打包。",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "NotoSerifSC",
                      fontSize: 25)),
            ]),
          ),
        ),
      ],
    ),
  ),
  Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(
            Icons.album,
            size: 45,
            color: Colors.red,
          ),
          title: Text(
            'WiFi设置-教程',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NotoSerifSC",
            ),
          ),
          subtitle: Text(
            '教程4',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "NotoSerifSC",
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          height: 450,
          width: 350,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <InlineSpan>[
              TextSpan(
                  text: "请您先打开蓝牙与机器连接，后与家中WiFi连接，只需在界面输入您家中WiFi密码，提交即可！",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "NotoSerifSC",
                      fontSize: 25)),
            ]),
          ),
        ),
      ],
    ),
  ),
  Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(
            Icons.album,
            size: 45,
            color: Colors.red,
          ),
          title: Text(
            '大件垃圾预约-教程',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NotoSerifSC",
            ),
          ),
          subtitle: Text(
            '教程3',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "NotoSerifSC",
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          height: 450,
          width: 350,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <InlineSpan>[
              TextSpan(
                  text: "对于不方便丢弃的大件垃圾（建材、家具、家电等），您可以在此页面进行预约，会有专业的团队联系您！",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "NotoSerifSC",
                      fontSize: 25)),
            ]),
          ),
        ),
      ],
    ),
  ),
  Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(
            Icons.album,
            size: 45,
            color: Colors.red,
          ),
          title: Text(
            '数据统计-教程',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NotoSerifSC",
            ),
          ),
          subtitle: Text(
            '教程2',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "NotoSerifSC",
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          height: 450,
          width: 350,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <InlineSpan>[
              TextSpan(
                  text: "您能看到本机器每月的垃圾统计情况，以图表的形式向您呈现。",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "NotoSerifSC",
                      fontSize: 25)),
            ]),
          ),
        ),
      ],
    ),
  ),
  Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(
            Icons.album,
            size: 45,
            color: Colors.red,
          ),
          title: Text(
            '分类教学-教程',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "NotoSerifSC",
            ),
          ),
          subtitle: Text(
            '教程1',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "NotoSerifSC",
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          height: 450,
          width: 350,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: <InlineSpan>[
              TextSpan(
                  text: "您可以学习许多新的分类知识，以答题的形式向您呈现，每次只需回答10道题。",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "NotoSerifSC",
                      fontSize: 25)),
              TextSpan(
                  text: '\u000D 注：题库会不断更新。',
                  style: TextStyle(
                      color: Colors.red[100],
                      fontFamily: "NotoSerifSC",
                      fontSize: 20)),
            ]),
          ),
        ),
      ],
    ),
  ),
];
