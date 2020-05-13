import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:intelli_bin/components/Browser.dart';
import 'package:intelli_bin/pages/loginPage/login_page.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      constraints: const BoxConstraints(maxHeight: 240.0),
      child: new ListView(
        padding: const EdgeInsets.only(left: 5.0),
        children: <Widget>[
          _buildListItem("GitHub", Icons.web, () {
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              return new Browser(
                url: "https://github.com/Liar-zzy/Intelli_Bin_Flutter",
                title: "github",
              );
            }));
          }),
          _buildListItem("关于我", Icons.markunread, () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return new AlertDialog(
                  title: new Text(
                    '问题反馈',
                    style: TextStyle(
                      fontFamily: "NotoSerifSC",
                      fontSize: 16.0,
                    ),
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(
                          "微信：15698268177",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "NotoSerifSC",
                              fontSize: 20,
                              color: Colors.grey),
                        ),
                        // Image.asset(
                        //   "assets/images/weixin.jpg",
                        //   width: 120,
                        //   height: 120,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                        ),
                        Text(
                          "QQ：240241846",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "NotoSerifSC",
                              fontSize: 20,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('确定'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }),
          _buildListItem("退出登录", Icons.exit_to_app, () {
            Navigator.pushAndRemoveUntil(
              context,
              new MaterialPageRoute(builder: (context) => LoginPage()),
              ModalRoute.withName('/'),
            );
            BotToast.showText(text: "已退出");
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, IconData iconData, VoidCallback action) {
    final textStyle = new TextStyle(
        color: Colors.black54,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        fontFamily: "NotoSerifSC");

    return new InkWell(
      onTap: action,
      child: new Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, bottom: 5.0, top: 5.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 35.0,
              height: 35.0,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: new BoxDecoration(
                color: Colors.purple,
                borderRadius: new BorderRadius.circular(5.0),
              ),
              alignment: Alignment.center,
              child: new Icon(iconData, color: Colors.white, size: 24.0),
            ),
            new Text(title, style: textStyle),
            new Expanded(child: new Container()),
            new IconButton(
                icon: new Icon(Icons.chevron_right, color: Colors.black26),
                onPressed: action)
          ],
        ),
      ),
    );
  }
}
