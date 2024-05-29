import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:biusrat_app_fitness/view/entrena_tracker/entrenamiento_tracker_view.dart';
import 'package:biusrat_app_fitness/view/plan_comida/meal_plan_view.dart';
import 'package:biusrat_app_fitness/view/sleep_tracker/sleep_tracker_view.dart';
import 'package:flutter/material.dart';

class SelectView extends StatelessWidget {
  final String correo;
  const SelectView({super.key, required this.correo});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundBtn(
                title: "Seguimiento de Entrenamiento",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EntrenamientoTrackerView(correo: correo),
                    ),
                  );
                }),

                const SizedBox(height: 15,),

                  RoundBtn(
                title: "Planificador de comida",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealPlanView(correo: correo),
                    ),
                  );
                }),

                const SizedBox(height: 15,),

                  RoundBtn(
                title: "Seguimiento de sueño",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SleepTrackerView(correo:correo),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}