import 'dart:convert';

import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/detalle_comida_row.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:biusrat_app_fitness/constants/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';

class ComidaInfoDetalleView extends StatefulWidget {
  final Map mObj;
  final Map dObj;
  const ComidaInfoDetalleView(
      {super.key, required this.dObj, required this.mObj});

  @override
  State<ComidaInfoDetalleView> createState() => _ComidaInfoDetalleViewState();
}

class _ComidaInfoDetalleViewState extends State<ComidaInfoDetalleView> {
    List<Map<String, dynamic>> nutritionArr = [];
    List<Map<String, dynamic>> ingredientsArr = [];
    List<Map<String, dynamic>> stepArr = [];
 fetchData() async {
        
    try {
      http.Response nuttri = await http.get(Uri.parse(apiNuttri));
      http.Response ingre = await http.get(Uri.parse(apiIngre));
      http.Response paso = await http.get(Uri.parse(apiPaso));
      if (nuttri.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(nuttri.body); 
        for (var item in jsonData) {
          nutritionArr.add(item);
        }
      setState(() {
        });
      }
      if (ingre.statusCode == 200) {
        List<dynamic> jsonDat = jsonDecode(ingre.body); 
        for (var item in jsonDat) {
          ingredientsArr.add(item);
        }
      setState(() {
        });
      }
      if (paso.statusCode == 200) {
        List<dynamic> jsonDa = jsonDecode(paso.body); 
        for (var item in jsonDa) {
          stepArr.add(item);
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

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: BColor.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
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
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: ClipRect(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Transform.scale(
                      scale: 1.25,
                      child: Container(
                        width: media.width * 0.55,
                        height: media.width * 0.55,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius:
                              BorderRadius.circular(media.width * 0.275),
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 1.25,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          widget.dObj["b_image"].toString(),
                          width: media.width * 0.50,
                          height: media.width * 0.50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
              color: BColor.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 4,
                            decoration: BoxDecoration(
                                color: BColor.gray.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(3)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.dObj["name"].toString(),
                                    style: TextStyle(
                                        color: BColor.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "Por James Ruth",
                                    style: TextStyle(
                                        color: BColor.gray, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Image.asset(
                                "assets/images/fav.png",
                                width: 15,
                                height: 15,
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Nutricion",
                          style: TextStyle(
                              color: BColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: nutritionArr.length,
                            itemBuilder: (context, index) {
                              var nObj = nutritionArr[index] as Map? ?? {};
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 4),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          BColor.primaryColor2.withOpacity(0.4),
                                          BColor.primaryColor1.withOpacity(0.4)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        nObj["image"].toString(),
                                        width: 15,
                                        height: 15,
                                        fit: BoxFit.contain,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          nObj["title"].toString(),
                                          style: TextStyle(
                                              color: BColor.black,
                                              fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Descripcion",
                          style: TextStyle(
                              color: BColor.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: ReadMoreText(
                          'Los panqueques son el desayuno favorito de algunas personas, ¿a quién no le gustan los panqueques? Especialmente con el toque de miel real encima de los panqueques, ¡por supuesto que a todos les encanta! además de ser Los panqueques son el desayuno favorito de algunas personas, ¿a quién no le gustan los panqueques? Especialmente con el toque de miel real encima de los panqueques, ¡por supuesto que a todos les encanta!',
                          trimLines: 4,
                          colorClickableText: BColor.black,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Leer Mas ...',
                          trimExpandedText: ' Leer menos',
                          style: TextStyle(
                            color: BColor.gray,
                            fontSize: 12,
                          ),
                          moreStyle: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Ingredient}es que \nnecesitas",
                              style: TextStyle(
                                  color: BColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "${stepArr.length} Items",
                                style:
                                    TextStyle(color: BColor.gray, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: (media.width * 0.25) + 40,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: ingredientsArr.length,
                            itemBuilder: (context, index) {
                              var nObj = ingredientsArr[index] as Map? ?? {};
                              return Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  width: media.width * 0.23,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: media.width * 0.23,
                                        height: media.width * 0.23,
                                        decoration: BoxDecoration(
                                            color: BColor.lightGray,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          nObj["image"].toString(),
                                          width: 45,
                                          height: 45,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        nObj["title"].toString(),
                                        style: TextStyle(
                                            color: BColor.black, fontSize: 12),
                                      ),
                                      Text(
                                        nObj["value"].toString(),
                                        style: TextStyle(
                                            color: BColor.gray, fontSize: 10),
                                      ),
                                    ],
                                  ));
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Paso por paso",
                              style: TextStyle(
                                  color: BColor.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "${stepArr.length} Pasos",
                                style:
                                    TextStyle(color: BColor.gray, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        shrinkWrap: true,
                        itemCount: stepArr.length,
                        itemBuilder: ((context, index) {
                          var sObj = stepArr[index] as Map? ?? {};

                          return DetalleComidaRow(
                            sObj: sObj,
                            isLast: stepArr.last == sObj,
                          );
                        }),
                      ),
                      SizedBox(
                        height: media.width * 0.25,
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RoundBtn(
                            title: "Agregar a la ${widget.mObj["name"]} comida",
                            onPressed: () {
                             
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}