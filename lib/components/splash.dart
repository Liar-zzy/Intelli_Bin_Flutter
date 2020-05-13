import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:intelli_bin/pages/loginPage/home_page.dart';
import '../pages/loginPage/user_provider.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
//启动界面设置
//使用封装好的 SplashScreen

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,

        //启动界面结束后显示界面
        // navigateAfterSeconds: TabWidget(),
        navigateAfterSeconds:
            new UserContainer(user: null, child: new HomePage()),
        title: Text(
          '欢迎使用！',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            fontFamily: "NotoSerifSC",
          ),
        ),
        loadingText: Text(
          "加载中...",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "NotoSerifSC",
              fontSize: 16.0),
        ),
        image: Image.asset("assets/images/start.png", fit: BoxFit.fill),
        // backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 80.0,
        loaderColor: Colors.red,
        gradientBackground: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: <Color>[const Color(0x00a8edea), const Color(0xFFfed6e3)],
        ));
  }
}
