import 'dart:convert';

import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:biusrat_app_fitness/common_widget/round_txtField.dart';
import 'package:biusrat_app_fitness/constants/api.dart';
import 'package:biusrat_app_fitness/view/login/objetivo_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const List<String> dropList = <String>['Hombre', 'Mujer'];

class CompletarPerfilView extends StatefulWidget {
  final String nombre;
  final String apellido;
  final String email;
  final String password;
  const CompletarPerfilView({super.key, required this.nombre, required this.apellido, required this.email, required this.password});
  @override
  State<CompletarPerfilView> createState() => _CompletarPerfilViewState();
}

class _CompletarPerfilViewState extends State<CompletarPerfilView> {
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtPeso = TextEditingController();
  TextEditingController txtAltura = TextEditingController();
  String dropValue = dropList.first;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/complete_profile.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Vamos a completar el perfil",
                  style: TextStyle(
                      color: BColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Esto nos ayudara a conocerte mejor!",
                  style: TextStyle(color: BColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: BColor.lightGray,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  
                                  child: Image.asset(
                                    "assets/images/gender.png",
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                    color: BColor.gray,
                                  )),
                            
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: dropValue,
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropValue = value!;
                                      });
                                    },
                                    items: dropList
                                        .map((name) => DropdownMenuItem(
                                              value: name,
                                              child: Text(
                                                name,
                                                style: TextStyle(
                                                    color: BColor.gray,
                                                    fontSize: 14),
                                              ),
                                            ))
                                        .toList(),
                                    isExpanded: true,
                                    hint: Text(
                                      "Cual es tu genero",
                                      style: TextStyle(
                                          color: BColor.gray, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),

                             const SizedBox(width: 8,)

                            ],
                          ),),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTxtField(
                        controller: txtDate,
                        hitText: "Fecha de Nacimiento",
                        icon: "assets/images/date.png",
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTxtField(
                              controller: txtPeso,
                              hitText: "Peso",
                              icon: "assets/images/weight.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: BColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style:
                                  TextStyle(color: BColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTxtField(
                              controller: txtAltura,
                              hitText: "Altura",
                              icon: "assets/images/hight.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: BColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style:
                                  TextStyle(color: BColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      RoundBtn(
                          title: "Siguiente >",
                          onPressed: () async {
                            String nombre = widget.nombre;
                            String apellido = widget.apellido;
                            String email = widget.email;
                            String password = widget.password;
                            String f = txtDate.text;
                            String fecha = f.replaceAll("/", "-");
                            String peso = txtPeso.text;
                            String altu = txtAltura.text;
                            Map<String, String> data = {
                              'nombre': nombre,
                              'apellido': apellido,
                              'correo': email,
                              'password': password,
                              'genero': dropValue,
                              'fecha_nacimiento': fecha,
                              'peso': peso,
                              'altura': altu
                            };
                            String requestBody = jsonEncode(data);
                            print(requestBody);
                            var response = await http.post(Uri.parse(apiUserReg), headers: {
                              "Content-Type": "application/json"
                            }, body: requestBody)
                            .then((response)=> {
                              if(response.statusCode == 201){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ObjetivoView(email: email,)))
                              }
                            });            
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}