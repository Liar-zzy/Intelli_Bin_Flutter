import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:intelli_bin/components/splash.dart';
import 'package:intelli_bin/pages/homePage/morePages/order.dart';
import 'package:intelli_bin/pages/homePage/morePages/safePage.dart';
import 'package:intelli_bin/pages/homePage/morePages/statisticsPage.dart';
import 'package:intelli_bin/pages/homePage/morePages/teachPage.dart';
import 'package:intelli_bin/pages/homePage/morePages/wifiPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '智慧分',

      builder: BotToastInit(), //1.调用BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2.注册路由观察者

      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: new UserContainer(user: null, child: new HomePage()),
      home: Splash(),
      routes: {
        '/statistics': (context) => StatisticsPage(),
        '/order': (context) => OrderPage(),
        '/safe': (context) => SafePage(),
        '/teach': (context) => TeachPage(),
        '/wifi': (context) => WifiPage(),
      },
    );
  }
}
