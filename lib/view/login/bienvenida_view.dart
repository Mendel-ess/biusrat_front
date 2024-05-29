import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:biusrat_app_fitness/view/main/main_view.dart';
import 'package:flutter/material.dart';

class BienvenidaView extends StatefulWidget {
  final String correo;
  const BienvenidaView({super.key, required this.correo});

  @override
  State<BienvenidaView> createState() => _BienvenidaViewState();
}

class _BienvenidaViewState extends State<BienvenidaView> {

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
SizedBox(
                height: media.width * 0.1,
              ),
               Image.asset(
                "assets/images/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Bienvenido a BiusRat",
                style: TextStyle(
                    color: BColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Ya hemos configurado todo para que alcanzes tus\nobjetivos con nosotros",
                textAlign: TextAlign.center,
                style: TextStyle(color: BColor.gray, fontSize: 12),
              ),
             const Spacer(),

               RoundBtn(
                  title: "Go To Home",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainView(correo: widget.correo,)));
                  }),
               
            ],
          ),
        ),

      ),
    );
  }
}