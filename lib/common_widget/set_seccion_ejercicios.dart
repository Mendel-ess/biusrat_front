import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/ejercicios_row.dart';
import 'package:flutter/material.dart';

class SetSeccionEjerciciosView extends StatelessWidget {
  final Map sObj;
  final Function(Map obj) onPressed;
  const SetSeccionEjerciciosView ({super.key, required this.sObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          sObj["exercise_set"].toString(),
          style: TextStyle(
              color: BColor.black, fontSize: 12, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sObj.length,
            itemBuilder: (context, index) {
              var eObj = sObj[index] as Map? ?? {};
              return EjerciciosRow(eObj: eObj, onPressed: (){
                  onPressed(eObj);
              },);
            }),
      ],
    );
  }
}