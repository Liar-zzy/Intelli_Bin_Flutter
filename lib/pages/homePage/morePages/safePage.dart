import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'indicator.dart';

//状态查看
class SafePage extends StatefulWidget {
  SafePage({Key key}) : super(key: key);

  @override
  _SafePageState createState() => _SafePageState();
}

class _SafePageState extends State<SafePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  final List<String> _tabValues = [
    '干垃圾',
    '湿垃圾',
    '有害垃圾',
    '可回收垃圾',
  ];

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
        children: <Widget>[
          // BarChartSample1(
          //   month: 1,
          // ),
          // BarChartSample1(
          //   month: 2,
          // ),
          // BarChartSample1(
          //   month: 3,
          // ),
          // BarChartSample1(
          //   month: 4,
          // ),
          PieChartSample2(
            used: 40,
          ),
          PieChartSample2(
            used: 55,
          ),
          PieChartSample2(
            used: 30,
          ),
          PieChartSample2(
            used: 20,
          ),
        ],
      ),
    );
  }
}

class PieChartSample2 extends StatefulWidget {
  double use;
  PieChartSample2({double used = 40}) {
    use = used;
  }
  @override
  State<StatefulWidget> createState() => PieChart2State(usedA: use);
}

class PieChart2State extends State {
  double used;
  int touchedIndex;
  PieChart2State({double usedA = 40}) {
    used = usedA;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: const <Widget>[
                  Indicator(
                    color: Color(0xff0293ee),
                    text: '已使用',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Indicator(
                    color: Colors.grey,
                    text: '未使用',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData:
                          PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 5,
                      centerSpaceRadius: 40,
                      sections: showingSections(used)),
                ),
              ),
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(double used) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: used,
            title: used.toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.grey[200],
            value: (100 - used),
            title: (100 - used).toString() + '%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          );
        default:
          return null;
      }
    });
  }
}
