import 'dart:convert';

import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:biusrat_app_fitness/common_widget/round_txtField.dart';
import 'package:biusrat_app_fitness/constants/api.dart';
import 'package:biusrat_app_fitness/view/login/completar_perfil_view.dart';
import 'package:biusrat_app_fitness/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisrarView extends StatefulWidget {
  const RegisrarView({super.key});

  @override
  State<RegisrarView> createState() => _RegisrarViewState();
}

class _RegisrarViewState extends State<RegisrarView> {
  bool isCheck = false;
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Bienvenido,",
                  style: TextStyle(color: BColor.gray, fontSize: 16),
                ),
                Text(
                  "Crear Cuenta",
                  style: TextStyle(
                      color: BColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundTxtField(
                  hitText: "Nombres",
                  icon: "assets/images/user_text.png",
                  controller: nombreController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTxtField(
                  hitText: "Apellidos",
                  icon: "assets/images/user_text.png",
                  controller: apellidoController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                 RoundTxtField(
                  hitText: "Correo",
                  icon: "assets/images/email.png",
                  keyboardType: TextInputType.emailAddress,
                  controller: correoController,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTxtField(
                  hitText: "Contraseña",
                  controller: passwordController,
                  icon: "assets/images/lock.png",
                  obscureText: true,
                  rigtIcon: TextButton(
                      onPressed: () {},
                      child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            "assets/images/show_password.png",
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                            color: BColor.gray,
                          ))),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                      icon: Icon(
                        isCheck
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank_outlined,
                        color: BColor.gray,
                        size: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child:  Text(
                          "Aceptas nuestra Politica de Privacidad y\nTerminos de uso",
                          style: TextStyle(color: BColor.gray, fontSize: 10),
                        ),
                     
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.4,
                ),
                RoundBtn(title: "Registrar", onPressed: () async {
                  if (isCheck == true){
                    String nom = nombreController.text;
                    String pass = passwordController.text;
                    String corr = correoController.text;
                    String apel = apellidoController.text;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CompletarPerfilView(nombre: nom, apellido: apel, email: corr, password: pass)));
                    
                  }
                }),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: BColor.gray.withOpacity(0.5),
                    )),
                    Text(
                      "  O  ",
                      style: TextStyle(color: BColor.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: BColor.gray.withOpacity(0.5),
                    )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BColor.white,
                          border: Border.all(
                            width: 1,
                            color: BColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/images/google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),

                     SizedBox(
                      width: media.width * 0.04,
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BColor.white,
                          border: Border.all(
                            width: 1,
                            color: BColor.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/images/facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                TextButton(
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Ya tienes una cuenta? ",
                        style: TextStyle(
                          color: BColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Iniciar Sesion",
                        style: TextStyle(
                            color: BColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}