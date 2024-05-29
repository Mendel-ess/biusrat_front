
import 'package:biusrat_app_fitness/common/color.dart';
import 'package:flutter/material.dart';

class OnBoardPage extends StatelessWidget {
  final Map pObj;
  const OnBoardPage({super.key, required this.pObj});

  @override
  Widget build(BuildContext context){
    var media = MediaQuery.of(context).size;
    
    return SizedBox(
                  width: media.width,
                  height: media.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        pObj["image"].toString(), 
                        width: media.width,
                        fit: BoxFit.fitWidth,
                        ),

                        SizedBox(height: media.width * 0.1 ,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            pObj["titulo"].toString(), 
                            style: TextStyle(
                              color: BColor.black, 
                              fontSize: 24,
                              fontWeight: FontWeight.w700
                          ) ,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            pObj["subtitulo"].toString(),
                            style: TextStyle(
                              color: BColor.gray, 
                              fontSize: 14
                          ) ,
                          ),
                        ),

                    ],
                  ),
                );
  }
}

 
