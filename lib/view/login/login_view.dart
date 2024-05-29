import 'dart:convert';

import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/round_boton.dart';
import 'package:biusrat_app_fitness/common_widget/round_txtField.dart';
import 'package:biusrat_app_fitness/constants/api.dart';
import 'package:biusrat_app_fitness/view/main/main_view.dart';
import 'package:biusrat_app_fitness/view/login/completar_perfil_view.dart';
import 'package:biusrat_app_fitness/view/login/registrase_view.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isCheck = false;
  TextEditingController correoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hola!!,",
                  style: TextStyle(color: BColor.gray, fontSize: 16),
                ),
                Text(
                  "Bienvenido de vuelta",
                  style: TextStyle(
                      color: BColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTxtField(
                  controller: correoController,
                  hitText: "Correo",
                  icon: "assets/images/email.png",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTxtField(
                  controller: passwordController,
                  hitText: "Contraseña",
                  icon: "assets/images/lock.png",
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Olvidaste tu contraseña?",
                      style: TextStyle(
                          color: BColor.gray,
                          fontSize: 10,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
               const Spacer(),
                RoundBtn(
                    title: "Iniciar Sesion",
                    onPressed: () async {
                      String correo = correoController.text;
                      String password = passwordController.text;
                      Map<String, String> data = {
                        'correo': correo,
                        'password': password
                      };
                      String requestBody = jsonEncode(data);
                      print(requestBody);
                      var response = await http.post(Uri.parse(apiUserLog), headers: {'Content-Type': 'application/json'}, body: requestBody)
                      .then((response) {
                          if (response.statusCode==202){
                            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MainView(correo: correoController.text)));
                          }
                      }).catchError((error) {
                        print(error);
                      });
                      
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
                            builder: (context) => const RegisrarView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "No tienes una cuenta aun? ",
                        style: TextStyle(
                          color: BColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Registrarse",
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