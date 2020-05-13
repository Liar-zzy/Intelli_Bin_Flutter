import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';
import 'dart:async';

//数据统计

class StatisticsPage extends StatefulWidget {
  StatisticsPage({Key key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with SingleTickerProviderStateMixin {
  final List<String> _tabValues = [
    '一月',
    '二月',
    '三月',
    '四月',
    '五月',
    '六月',
    '七月',
    '八月',
    '九月',
    '十月',
    '十一月',
    '十二月',
  ];
  // {"month": '一月', "num":1},
  //   {"month":'二月',"num":2},
  //   {"month":'三月',"num":3},
  //   {"month":'四月',"num":4},
  //   {"month":'五月',"num":5},
  //   {"month":'六月',"num":6},
  //   {"month":'七月',"num":7},
  //   {"month":'八月',"num":8},
  //   {"month":'九月',"num":9},
  //   {"month":'十月',"num":10},
  //   {"month":'十一月', "num":11},
  //   {"month":'十二月', "num":12}

  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: TabBar(
          tabs: _tabValues.map((f) {
            return Text(f);
          }).toList(),
          controller: _controller,
          indicatorColor: Colors.red[100],
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          labelColor: Colors.red[100],
          unselectedLabelColor: Colors.black,
          indicatorWeight: 1.0,
          labelStyle: TextStyle(height: 2),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        //TabBarView 默认支持手势滑动，若要禁止设置 NeverScrollableScrollPhysics
        // physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          BarChartSample1(
            month: 1,
          ),
          BarChartSample1(
            month: 2,
          ),
          BarChartSample1(
            month: 3,
          ),
          BarChartSample1(
            month: 4,
          ),
          BarChartSample1(
            month: 5,
          ),
          BarChartSample1(
            month: 6,
          ),
          BarChartSample1(
            month: 7,
          ),
          BarChartSample1(
            month: 8,
          ),
          BarChartSample1(
            month: 9,
          ),
          BarChartSample1(
            month: 10,
          ),
          BarChartSample1(
            month: 11,
          ),
          BarChartSample1(
            month: 12,
          ),
        ],
      ),
    );
  }
}

class BarChartSample1 extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];
  int month;

  BarChartSample1({int month = 1}) {
    month = month;
  }

  @override
  State<StatefulWidget> createState() => BarChartSample1State(month: month);
}

class BarChartSample1State extends State<BarChartSample1> {
  int month;

  final Color barBackgroundColor = const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;
  bool isPlaying = true;

  //计时器
  Timer _timer;
  int _seconds = 15;

  List<int> trash_list = new List();
  double max = -1;

  BarChartSample1State({int month = 1}) {
    month = month;
    trash_list.add(15);
    trash_list.add(20);
    trash_list.add(30);
    trash_list.add(45);

    for (var i = 0; i < trash_list.length; i++) {
      if (max < trash_list[i]) {
        max = trash_list[i].toDouble();
      }
    }
    max = (max * 1.5);
    _startTimer();
  }

  //启动倒计时计时器
  void _startTimer() {
    isPlaying = true;
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_seconds == 0) {
        setState(() {});
        _cancleTimer();
        return;
      }
      _seconds--;
      setState(() {});
    });
  }

  //取消到倒计时的计时器
  void _cancleTimer() {
    isPlaying = false;
    _timer?.cancel();
    setState(() {
      if (isPlaying) {
        refreshState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: const Color(0xff81e5cd),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    '每月垃圾情况',
                    style: TextStyle(
                        color: const Color(0xff0f4a3c),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        isPlaying ? randomData() : mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: const Color(0xff0f4a3c),
                  ),
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                      if (isPlaying) {
                        refreshState();
                      }
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 30,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: max,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, trash_list[i].toDouble(),
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, trash_list[i].toDouble(),
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, trash_list[i].toDouble(),
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, trash_list[i].toDouble(),
                isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = '有害垃圾';
                  break;
                case 1:
                  weekDay = '可回收物';
                  break;
                case 2:
                  weekDay = '干垃圾';
                  break;
                case 3:
                  weekDay = '湿垃圾';
                  break;
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(
                      color: Colors.yellow,
                      fontSize: 15,
                      fontFamily: "NotoSerifSC"));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '有害垃圾';
              case 1:
                return '可回收物';
              case 2:
                return '干垃圾';
              case 3:
                return '湿垃圾';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return '有害垃圾';
              case 1:
                return '可回收物';
              case 2:
                return '干垃圾';
              case 3:
                return '湿垃圾';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(4, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(max.toInt()).toDouble(),
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(max.toInt()).toDouble(),
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(max.toInt()).toDouble(),
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(max.toInt()).toDouble(),
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          default:
            return null;
        }
      }),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      refreshState();
    }
  }
}
