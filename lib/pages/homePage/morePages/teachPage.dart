import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelli_bin/model/Questions.dart';
import '../../../data/quesData.dart';

//???? teach

class TeachPage extends StatefulWidget {
  TeachPage({Key key}) : super(key: key);

  @override
  _TeachPageState createState() => _TeachPageState();
}

class _TeachPageState extends State<TeachPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
            "分类教学",
            style: TextStyle(
              fontFamily: "NotoSerifSC",
            ),
          ),
        ),
        body: QuestionPage(),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  QuestionPage({Key key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Questions> questions = new List();

  int _currentQues = 0;
  int quesNum = 10;

  @override
  void initState() {
    //初始化questions
    questions = questionsList;
    quesNum = questions.length;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Container(
            width: width,
            height: 600,
            //color: Colors.red[100],
            padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blue,
                      gradient: new LinearGradient(
                        colors: [Color(0xfff83600), Color(0xfff9d423)],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '第${_currentQues + 1}/$quesNum题',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "NotoSerifSC",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    questions[_currentQues].ques,
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: "bold",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 550,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: width / 2,
                        child: RaisedButton(
                          elevation: 5.0,
                          highlightElevation: 5.0,
                          disabledElevation: 5.0,
                          color: Colors.grey[100],
                          child: RichText(
                            text: TextSpan(children: <InlineSpan>[
                              TextSpan(
                                  text: 'A',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ".             ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: questions[_currentQues].a,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ]),
                          ),
                          onPressed: () {
                            if (questions[_currentQues].ans == 1) {
                              BotToast.showText(text: "答案正确！");
                              _currentQues++;
                              setState(() {});
                            } else {
                              BotToast.showText(text: "答案错误！");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: width / 2,
                        child: RaisedButton(
                          elevation: 5.0,
                          highlightElevation: 5.0,
                          disabledElevation: 5.0,
                          color: Colors.grey[100],
                          child: RichText(
                            text: TextSpan(children: <InlineSpan>[
                              TextSpan(
                                  text: 'B',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ".             ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: questions[_currentQues].b,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ]),
                          ),
                          onPressed: () {
                            if (questions[_currentQues].ans == 2) {
                              BotToast.showText(text: "答案正确！");
                              _currentQues++;
                              setState(() {});
                            } else {
                              BotToast.showText(text: "答案错误！");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: width / 2,
                        child: RaisedButton(
                          elevation: 5.0,
                          highlightElevation: 5.0,
                          disabledElevation: 5.0,
                          color: Colors.grey[100],
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(children: <InlineSpan>[
                              TextSpan(
                                  text: 'C',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ".         ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: questions[_currentQues].c,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ]),
                          ),
                          onPressed: () {
                            if (questions[_currentQues].ans == 3) {
                              BotToast.showText(text: "答案正确！");
                              _currentQues++;
                              setState(() {});
                            } else {
                              BotToast.showText(text: "答案错误！");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: width / 2,
                        child: RaisedButton(
                          elevation: 5.0,
                          highlightElevation: 5.0,
                          disabledElevation: 5.0,
                          color: Colors.grey[100],
                          child: RichText(
                            text: TextSpan(children: <InlineSpan>[
                              TextSpan(
                                  text: 'D',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: ".         ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: questions[_currentQues].d,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ]),
                          ),
                          onPressed: () {
                            if (questions[_currentQues].ans == 4) {
                              BotToast.showText(text: "答案正确！");
                              _currentQues++;
                              setState(() {});
                            } else {
                              BotToast.showText(text: "答案错误！");
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Container(
                        height: 50,
                        width: width / 2 + 30,
                        child: CupertinoButton(
                          color: Colors.pink,
                          child: Text("下一题"),
                          onPressed: () {
                            if ((_currentQues + 1) == questions.length) {
                              BotToast.showText(text: "已是最后一题");
                            } else {
                              _currentQues++;
                              setState(() {});
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
