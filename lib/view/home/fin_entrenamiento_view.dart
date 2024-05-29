import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:flutter/material.dart';

class FinEntrenamientoView extends StatefulWidget {
  const FinEntrenamientoView({super.key});

  @override
  State<FinEntrenamientoView> createState() => _FinEntrenamientoViewState();
}

class _FinEntrenamientoViewState extends State<FinEntrenamientoView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
        
              const SizedBox(height: 20,),
              Image.asset(
                "assets/images/complete_workout.png",
                height: media.width * 0.8,
                fit: BoxFit.fitHeight,
              ),
        
              const SizedBox(
                height: 20,
              ),
        
              Text(
                "Felicitaciones. Haz terminado tu entrenamiento",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: BColor.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text(
                "El ejercicio es el rey y la nutricion es la reina. Combina ambos y conquistaras el reino",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: BColor.gray,
                  fontSize: 12,
                ),
              ),

              const SizedBox(
                height: 8,
              ),

              Text(
                "-Jack Lalanne",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: BColor.gray,
                  fontSize: 12,
                ),
              ),

              const Spacer(),
               RoundBtn(
                  title: "Volver al inicio",
                  onPressed: () {
                    Navigator.pop(context);
                  }),

                 const SizedBox(
                height: 8,
              ),



            ],
          ),
        ),
      ),
    );
  }
}