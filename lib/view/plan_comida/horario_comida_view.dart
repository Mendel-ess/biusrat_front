import 'dart:convert';

import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/comida_horario.dart';
import 'package:biusrat_app_fitness/common_widget/nutricion_row.dart';
import 'package:biusrat_app_fitness/constants/api.dart';
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HorarioComidaView extends StatefulWidget {
  const HorarioComidaView({super.key});

  @override
  State<HorarioComidaView> createState() => _HorarioComidaViewState();
}

class _HorarioComidaViewState extends State<HorarioComidaView> {
  CalendarAgendaController _calendarAgendaControllerAppBar =
      CalendarAgendaController();

  late DateTime _selectedDateAppBBar;
  List<Map<String, dynamic>> breakfastArr = [];
  List<Map<String, dynamic>> lunchArr = [];
  List<Map<String, dynamic>> snacksArr = [];
  List<Map<String, dynamic>> dinnerArr = [];
  List<Map<String, dynamic>> nutritionArr = [];

 fetchData() async {
        
    try {
      http.Response desayuno = await http.get(Uri.parse(apiDes));
      http.Response almuerzo = await http.get(Uri.parse(apiAlm));
      http.Response snack = await http.get(Uri.parse(apiSnack));
      http.Response cena = await http.get(Uri.parse(apiCena));
      http.Response nutri = await http.get(Uri.parse(apiNutri));
      if (desayuno.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(desayuno.body); 
        for (var item in jsonData) {
          breakfastArr.add(item);
        }
      setState(() {
        });
      }
      if (almuerzo.statusCode == 200) {
        List<dynamic> jsonDat = jsonDecode(almuerzo.body); 
        for (var item in jsonDat) {
          lunchArr.add(item);
        }
      setState(() {
        });
      }
      if (snack.statusCode == 200) {
        List<dynamic> jsonDa = jsonDecode(snack.body); 
        for (var item in jsonDa) {
          snacksArr.add(item);
        }
      setState(() {
        });
      }
      if (cena.statusCode == 200) {
        List<dynamic> jsonDa = jsonDecode(cena.body); 
        for (var item in jsonDa) {
          dinnerArr.add(item);
        }
      setState(() {
        });
      }
      if (nutri.statusCode == 200) {
        List<dynamic> jsonDa = jsonDecode(nutri.body); 
        for (var item in jsonDa) {
          nutritionArr.add(item);
        }
      setState(() {
        });
      }
    } catch (e) {
      print('Ha ocurrido el siguiente error: $e');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
    _selectedDateAppBBar = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
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
          "Horario de comida",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarAgenda(
            controller: _calendarAgendaControllerAppBar,
            appbar: false,
            selectedDayPosition: SelectedDayPosition.center,
            leading: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/images/ArrowLeft.png",
                  width: 15,
                  height: 15,
                )),
            // training: IconButton(
            //     onPressed: () {},
            //     icon: Image.asset(
            //       "assets/images/ArrowRight.png",
            //       width: 15,
            //       height: 15,
            //     )),
            weekDay: WeekDay.short,
            // dayNameFontSize: 12,
            // dayNumberFontSize: 16,
            // dayBGColor: Colors.grey.withOpacity(0.15),
            // titleSpaceBetween: 15,
            backgroundColor: Colors.transparent,
            // fullCalendar: false,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            fullCalendarDay: WeekDay.short,
            selectedDateColor: Colors.white,
            dateColor: Colors.black,
            locale: 'en',

            initialDate: DateTime.now(),
            calendarEventColor: BColor.primaryColor2,
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 60)),

            onDateSelected: (date) {
              _selectedDateAppBBar = date;
            },
            // selectedDayLogo: Container(
            //   width: double.maxFinite,
            //   height: double.maxFinite,
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: BColor.primaryG,
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter),
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            // ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Desayuno",
                        style: TextStyle(
                            color: BColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${breakfastArr.length} Items | 230 calories",
                          style: TextStyle(color: BColor.gray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: breakfastArr.length,
                    itemBuilder: (context, index) {
                      var mObj = breakfastArr[index] as Map? ?? {};
                      return ComidaHorario(
                        mObj: mObj,
                        index: index,
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Almuerzo",
                        style: TextStyle(
                            color: BColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${lunchArr.length} Items | 500 calories",
                          style: TextStyle(color: BColor.gray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: lunchArr.length,
                    itemBuilder: (context, index) {
                      var mObj = lunchArr[index] as Map? ?? {};
                      return ComidaHorario(
                        mObj: mObj,
                        index: index,
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Snacks",
                        style: TextStyle(
                            color: BColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${snacksArr.length} Items | 140 calories",
                          style: TextStyle(color: BColor.gray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snacksArr.length,
                    itemBuilder: (context, index) {
                      var mObj = snacksArr[index] as Map? ?? {};
                      return ComidaHorario(
                        mObj: mObj,
                        index: index,
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cena",
                        style: TextStyle(
                            color: BColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "${dinnerArr.length} Items | 120 calories",
                          style: TextStyle(color: BColor.gray, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dinnerArr.length,
                    itemBuilder: (context, index) {
                      var mObj = dinnerArr[index] as Map? ?? {};
                      return ComidaHorario(
                        mObj: mObj,
                        index: index,
                      );
                    }),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Comida Nutricional del dia",
                        style: TextStyle(
                            color: BColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: nutritionArr.length,
                    itemBuilder: (context, index) {
                      var nObj = nutritionArr[index] as Map? ?? {};

                      return NutricionRow(
                        nObj: nObj,
                      );
                    }),
                SizedBox(
                  height: media.width * 0.05,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}