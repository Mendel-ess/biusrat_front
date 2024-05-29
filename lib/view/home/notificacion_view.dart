import 'package:biusrat_app_fitness/common_widget/notificacion.dart';
import 'package:flutter/material.dart';
import 'package:biusrat_app_fitness/common/color.dart';

class NotificacionView extends StatefulWidget {
  const NotificacionView({super.key});

  @override
  State<NotificacionView> createState() => _NotificacionViewState();
}

class _NotificacionViewState extends State<NotificacionView> {
  List notificationArr = [
    {"image": "assets/images/Workout1.png", "title": "Hey, Es hora de comer", "time": "Hace 1 minuto"},
    {"image": "assets/images/Workout2.png", "title": "No olvides tu entrenamiento de tren inferior", "time": "Hace 3 horas"},
    {"image": "assets/images/Workout3.png", "title": "Hey, no descuides tu alimentacion", "time": "Hace 3 horas"},
    {"image": "assets/images/Workout1.png", "title": "Felicidades, Haz acabado tu Entre..", "time": "29 de Mayo"},
    {"image": "assets/images/Workout2.png", "title": "Hey, Es hora de comer", "time": "8 de Abril"},
    {"image": "assets/images/Workout3.png", "title": "Ups, Haz olvidad el entrenamiento de tren Inf...", "time": "8 de Abril"},
  ];

  @override
  Widget build(BuildContext context) {
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
          "Notificacion",
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
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: BColor.white,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var nObj = notificationArr[index] as Map? ?? {};
          return Notificacion(nObj: nObj);
      }), separatorBuilder: (context, index){
        return Divider(color: BColor.gray.withOpacity(0.5), height: 1, );
      }, itemCount: notificationArr.length),
    );
  }
}