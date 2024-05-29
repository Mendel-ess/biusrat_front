import 'dart:convert';

import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/horario_sleep_hoy.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:biusrat_app_fitness/constants/api.dart';
import 'package:biusrat_app_fitness/view/sleep_tracker/sleep_horario_view.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SleepTrackerView extends StatefulWidget {
  final String correo;
  const SleepTrackerView({super.key, required this.correo});

  @override
  State<SleepTrackerView> createState() => _SleepTrackerViewState();
}

class _SleepTrackerViewState extends State<SleepTrackerView> {
  List<Map<String, dynamic>> todaySleepArr = [];
  List<Map<String, dynamic>> findEatArr = [];
  fetchData() async {
        
    try {
      http.Response hoy = await http.get(Uri.parse(apiHoy));
      http.Response findeat = await http.get(Uri.parse(apiFindEat));
      if (hoy.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(hoy.body); 
        for (var item in jsonData) {
          todaySleepArr.add(item);
        }
      setState(() {
        });
      }
      if (findeat.statusCode == 200) {
        List<dynamic> jsonDat = jsonDecode(findeat.body); 
        for (var item in jsonDat) {
          findEatArr.add(item);
        }
      setState(() {
        });
      }
    } catch (e) {
      print('Ha ocurrido el siguiente error: $e');
    }
  }
  
  @override
  void initState(){
    fetchData();
    super.initState();
  }


  List<int> showingTooltipOnSpots = [4];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final tooltipsOnBar = lineBarsData1[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: BColor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/images/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Sleep Tracker",
          style: TextStyle(
              color: BColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: BColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/images/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: BColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 15),
                      height: media.width * 0.5,
                      width: double.maxFinite,
                      child: LineChart(
                        LineChartData(
                          showingTooltipIndicators:
                              showingTooltipOnSpots.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData1.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                              if (event is FlTapUpEvent) {
                                final spotIndex =
                                    response.lineBarSpots!.first.spotIndex;
                                showingTooltipOnSpots.clear();
                                setState(() {
                                  showingTooltipOnSpots.add(spotIndex);
                                });
                              }
                            },
                            mouseCursorResolver: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                  FlLine(
                                    color: Colors.transparent,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                      radius: 3,
                                      color: Colors.white,
                                      strokeWidth: 1,
                                      strokeColor: BColor.primaryColor2,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              //tooltipBgColor: BColor.secondaryColor1,
                              tooltipRoundedRadius: 5,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    "${lineBarSpot.y.toInt()} hours",
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData1,
                          minY: -0.01,
                          maxY: 10.01,
                          titlesData: FlTitlesData(
                              show: true,
                              leftTitles: AxisTitles(),
                              topTitles: AxisTitles(),
                              bottomTitles: AxisTitles(
                                sideTitles: bottomTitles,
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: rightTitles,
                              )),
                          gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            horizontalInterval: 2,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: BColor.gray.withOpacity(0.15),
                                strokeWidth: 2,
                              );
                            },
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: media.width * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: BColor.primaryG),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Last Night Sleep",
                              style: TextStyle(
                                color: BColor.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "8h 20m",
                              style: TextStyle(
                                  color: BColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            "assets/images/SleepGraph.png",
                            width: double.maxFinite,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    decoration: BoxDecoration(
                      color: BColor.primaryColor2.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily Sleep Schedule",
                          style: TextStyle(
                              color: BColor.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 70,
                          height: 25,
                          child: RoundBtn(
                            title: "Check",
                            type: RoundButtonType.bgGradient,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SleepHorarioView(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    "Today Schedule",
                    style: TextStyle(
                        color: BColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: todaySleepArr.length,
                      itemBuilder: (context, index) {
                        var sObj = todaySleepArr[index] as Map? ?? {};
                        return HorarioSleepHoy(
                          sObj: sObj,
                        );
                      }),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          BColor.primaryColor2,
          BColor.primaryColor1,
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            BColor.primaryColor2,
            BColor.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        spots: const [
          FlSpot(1, 3),
          FlSpot(2, 5),
          FlSpot(3, 4),
          FlSpot(4, 7),
          FlSpot(5, 4),
          FlSpot(6, 8),
          FlSpot(7, 5),
        ],
      );

  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 2,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0h';
        break;
      case 2:
        text = '2h';
        break;
      case 4:
        text = '4h';
        break;
      case 6:
        text = '6h';
        break;
      case 8:
        text = '8h';
        break;
      case 10:
        text = '10h';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: BColor.gray,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: BColor.gray,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}