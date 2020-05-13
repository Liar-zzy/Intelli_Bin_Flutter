import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageBody extends StatefulWidget {
  HomePageBody({Key key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  List<Map> imageList = [
    {"url": "assets/images/swiper1.png"},
    {"url": "assets/images/swiper2.png"},
    {"url": "assets/images/swiper3.png"},
    {"url": "assets/images/swiper4.png"},
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920);

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final conWidth = width / 3 - 20;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: width,
          padding: EdgeInsets.all(10),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  imageList[index]["url"],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: imageList.length,
              pagination: new SwiperPagination(),
              control: null,
            ),
          ),
        ),
        Container(
          height: ScreenUtil().setHeight(150),
          width: width,
          child: Image.asset(
            'assets/images/divider.png',
            fit: BoxFit.fill,
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(1.5, 1.0)),
                ],
              ),
              child: InkWell(
                onTap: () {
                  print("分类教学");
                  Navigator.pushNamed(context, '/teach');
                },
                child: Container(
                  height: conWidth,
                  width: conWidth,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: conWidth / 5,
                      ),
                      Image.asset(
                        'assets/images/learn.png',
                        height: conWidth * (10 / 25),
                        width: conWidth * (10 / 25),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '分类教学',
                        style: TextStyle(
                            fontFamily: "NotoSerifSC",
                            fontSize: conWidth * (3 / 25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(0, 1.5)),
                ],
              ),
              child: InkWell(
                onTap: () {
                  print("数据统计");
                  Navigator.pushNamed(context, '/statistics');
                },
                child: Container(
                  height: conWidth,
                  width: conWidth,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: conWidth / 5,
                      ),
                      Image.asset(
                        'assets/images/statistics.png',
                        height: conWidth * (10 / 25),
                        width: conWidth * (10 / 25),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '数据统计',
                        style: TextStyle(
                            fontFamily: "NotoSerifSC",
                            fontSize: conWidth * (3 / 25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(-1.5, 1.0)),
                ],
              ),
              child: InkWell(
                onTap: () {
                  print("inkwell 3");
                  Navigator.pushNamed(context, '/order');
                },
                child: Container(
                  height: conWidth,
                  width: conWidth,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: conWidth / 5,
                      ),
                      Image.asset(
                        'assets/images/order.png',
                        height: conWidth * (10 / 25),
                        width: conWidth * (10 / 25),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '大件垃圾预约',
                        style: TextStyle(
                            fontFamily: "NotoSerifSC",
                            fontSize: conWidth * (3 / 25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(1.5, 1.0)),
                ],
              ),
              child: InkWell(
                onTap: () {
                  print("inkwell 4");
                  Navigator.pushNamed(context, '/wifi');
                },
                child: Container(
                  height: conWidth,
                  width: conWidth,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: conWidth / 5,
                      ),
                      Image.asset(
                        'assets/images/wifi.png',
                        height: conWidth * (10 / 25),
                        width: conWidth * (10 / 25),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'WiFi 设置',
                        style: TextStyle(
                            fontFamily: "NotoSerifSC",
                            fontSize: conWidth * (3 / 25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(0, 1.0)),
                ],
              ),
              child: InkWell(
                onTap: () {
                  print("inkwell 4");
                  Navigator.pushNamed(context, '/safe');
                },
                child: Container(
                  height: conWidth,
                  width: conWidth,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: conWidth / 5,
                      ),
                      Image.asset(
                        'assets/images/safe.png',
                        height: conWidth * (10 / 25),
                        width: conWidth * (10 / 25),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '状态查看',
                        style: TextStyle(
                            fontFamily: "NotoSerifSC",
                            fontSize: conWidth * (3 / 25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1,
                      color: Colors.grey,
                      offset: Offset(-1.5, 1.0)),
                ],
              ),
              child: InkWell(
                onTap: () {
                  BotToast.showText(text: "已打包");
                },
                child: Container(
                  height: conWidth,
                  width: conWidth,
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: conWidth / 5,
                      ),
                      Image.asset(
                        'assets/images/bag.png',
                        height: conWidth * (10 / 25),
                        width: conWidth * (10 / 25),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '打包',
                        style: TextStyle(
                            fontFamily: "NotoSerifSC",
                            fontSize: conWidth * (3 / 25)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        )
      ],
    );
  }
}
