import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/icon_title_next_row.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:flutter/material.dart';

class SleepAlarmaView extends StatefulWidget {
  final DateTime date;
  const SleepAlarmaView({super.key, required this.date});

  @override
  State<SleepAlarmaView> createState() => _SleepAlarmaViewState();
}

class _SleepAlarmaViewState extends State<SleepAlarmaView> {

  bool positive = false;
  
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
              "assets/images/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Add Alarm",
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         
          
          
          const SizedBox(
            height: 8,
          ),
          IconTitleNextRow(
              icon: "assets/images/Bed_Add.png",
              title: "Bedtime",
              time: "09:00 PM",
              color: BColor.lightGray,
              onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
          IconTitleNextRow(
              icon: "assets/images/HoursTime.png",
              title: "Hours of sleep",
              time: "8hours 30minutes",
              color: BColor.lightGray,
              onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
          IconTitleNextRow(
              icon: "assets/images/Repeat.png",
              title: "Repeat",
              time: "Mon to Fri",
              color: BColor.lightGray,
              onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
         Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: BColor.lightGray,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               const SizedBox(width: 15,), 
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/Vibrate.png",
                    width: 18,
                    height: 18,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Vibrate When Alarm Sound",
                    style: TextStyle(color: BColor.gray, fontSize: 12),
                  ),
                ),
                

                SizedBox(
                  height: 30,
                  child: Transform.scale(
                    scale: 0.7,
                    child: CustomAnimatedToggleSwitch<bool>(
                      current: positive,
                      values: [false, true],
                      //dif: 0.0,
                      indicatorSize: const Size.square(30.0),
                      animationDuration: const Duration(milliseconds: 200),
                      animationCurve: Curves.linear,
                      onChanged: (b) => setState(() => positive = b),
                      iconBuilder: (context, local, global) {
                        return const SizedBox();
                      },
                      // defaultCursor: SystemMouseCursors.click,
                      // onTap: () => setState(() => positive = !positive),
                      iconsTappable: false,
                      wrapperBuilder: (context, global, child) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                                left: 10.0,
                                right: 10.0,
                                height: 30.0,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: BColor.secondaryG),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0)),
                                  ),
                                )),
                            child,
                          ],
                        );
                      },
                      foregroundIndicatorBuilder: (context, global) {
                        return SizedBox.fromSize(
                          size: const Size(10, 10),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: BColor.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50.0)),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: 0.05,
                                    blurRadius: 1.1,
                                    offset: Offset(0.0, 0.8))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
               
              ],
            ),
          ),
          const Spacer(),
          RoundBtn(title: "Add", onPressed: () {}),
          const SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}