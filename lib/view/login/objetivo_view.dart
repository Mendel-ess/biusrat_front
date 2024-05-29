import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:biusrat_app_fitness/constants/api.dart';
import 'package:biusrat_app_fitness/models/programa.dart';
import 'package:biusrat_app_fitness/view/login/bienvenida_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ObjetivoView extends StatefulWidget {
  final String email;
  const ObjetivoView({super.key, required this.email});
  @override
  State<ObjetivoView> createState() => _ObjetivoViewState();
}

class _ObjetivoViewState extends State<ObjetivoView> {
  CarouselController buttonCarouselController = CarouselController();
  int idProgram = 0;
  List<Map<String, dynamic>> data = [];

  fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(apiProgramaUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body); 
        for (var item in jsonData) {
          data.add(item);
        }
      setState(() {});
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

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BColor.white,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
              items: data
                  .map(
                    (gObj) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: BColor.primaryG,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: media.width * 0.1, horizontal: 25),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              gObj["image"].toString(),
                              width: media.width * 0.5,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: media.width * 0.1,
                            ),
                            Text(
                              gObj["nombre_programa"].toString(),
                              style: TextStyle(
                                  color: BColor.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: media.width * 0.1,
                              height: 1,
                              color: BColor.white,
                            ),
                            SizedBox(
                              height: media.width * 0.01,
                            ),
                            Container(
                              width: media.width * 0.75 ,
                              height: media.height * 0.2, // Establece el ancho máximo para el texto
                              child: Text(
                                gObj["descrip_programa"].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: BColor.white, fontSize: 12),
                                softWrap: true, // Permite que el texto se divida en varias líneas si es necesario
                                maxLines: 5, // Maneja el desbordamiento de texto
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                aspectRatio: 0.74,
                initialPage: 0,
                onPageChanged: ((index, reason) => {
                  setState((){
                      idProgram = index+1;     
                  })
                })
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: media.width,
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Cual es tu Objetivo ?",
                  style: TextStyle(
                      color: BColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Esto nos ayudara a escoger el mejor\nprograma para ti",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: BColor.gray, fontSize: 12),
                ),
                const Spacer(),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundBtn(
                    title: "Confirmar",
                    onPressed: () async {
                      Map<String, String> data = {
                        "correo": widget.email,
                        "id_programa": idProgram.toString()
                      };
                      var requestBody = jsonEncode(data);
                      var response = await http.put(Uri.parse(apiUserUpt), headers: {
                              "Content-Type": "application/json"
                            }, body: requestBody)
                            .then((response)=> {
                              if(response.statusCode == 202){
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BienvenidaView(correo: widget.email,)))
                              } else {
                                print(response.body)                              }
                    });
                    }),
              ],
            ),
          )
        ],
      )),
    );
  }
}