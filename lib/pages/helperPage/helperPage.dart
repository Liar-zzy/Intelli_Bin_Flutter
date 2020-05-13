import 'package:flutter/material.dart';
import 'package:intelli_bin/components/tab.dart';
import 'package:intelli_bin/data/cardList.dart';
import 'package:swipe_stack/swipe_stack.dart';

class HelperPage extends StatefulWidget {
  HelperPage({Key key}) : super(key: key);

  @override
  _HelperPageState createState() => _HelperPageState();
}

class _HelperPageState extends State<HelperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: HelperBodyPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            new MaterialPageRoute(
                builder: (context) => new TabWidget(
                      currentIndex: 1,
                    )),
            ModalRoute.withName('/'),
          );
        },
      ),
    );
  }
}

class HelperBodyPage extends StatefulWidget {
  HelperBodyPage({Key key}) : super(key: key);

  @override
  _HelperBodyPageState createState() => _HelperBodyPageState();
}

class _HelperBodyPageState extends State<HelperBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 570,
            width: 480,
            child: SwipeStack(
              children: [0, 1, 2, 3, 4, 5].map((int index) {
                return SwiperItem(
                    builder: (SwiperPosition position, double progress) {
                  return Material(
                      //elevation: 4,
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      child: Container(
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   borderRadius: BorderRadius.all(Radius.circular(6)),
                          // ),
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[cardList[index]],
                      )));
                });
              }).toList(),
              visibleCount: 3,
              stackFrom: StackFrom.Top,
              translationInterval: 6,
              scaleInterval: 0.03,
              onEnd: () => debugPrint("onEnd"),
              onSwipe: (int index, SwiperPosition position) =>
                  debugPrint("onSwipe $index $position"),
              onRewind: (int index, SwiperPosition position) =>
                  debugPrint("onRewind $index $position"),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
