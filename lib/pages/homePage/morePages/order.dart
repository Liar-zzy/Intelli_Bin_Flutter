import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//大件垃圾预约

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
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
        centerTitle: true,
        title: Text(
          "垃圾预约",
          style: TextStyle(
            fontFamily: "NotoSerifSC",
          ),
        ),
      ),
      body: OrderBodyPage(),
    );
  }
}

class OrderBodyPage extends StatefulWidget {
  OrderBodyPage({Key key}) : super(key: key);

  @override
  _OrderBodyPageState createState() => _OrderBodyPageState();
}

class _OrderBodyPageState extends State<OrderBodyPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            child: Image.asset('assets/images/bin.jpg'),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Container(
            height: 260,
            width: width / 1.5,
            //color: Colors.red[100],
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.important_devices),
                      labelText: '名称 ：',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.insert_chart),
                      labelText: '材质 ：',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
                TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.format_list_numbered),
                      labelText: '数量 ：',
                      labelStyle: TextStyle(color: Colors.black)),
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp("[0-9]")),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.hdr_strong),
                      labelText: '地址 ：',
                      labelStyle: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 50,
            width: width / 2 + 30,
            child: CupertinoButton(
              color: Colors.pink,
              child: Text("提交"),
              onPressed: () {
                BotToast.showText(text: "预约成功");
                setState(() {
                  Navigator.pop(context);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
