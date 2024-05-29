
import 'package:biusrat_app_fitness/common/color.dart';
import 'package:biusrat_app_fitness/common_widget/on_board_page.dart';
import 'package:biusrat_app_fitness/view/login/registrase_view.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  int selectPage = 0;
  PageController controller = PageController();
  
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {
        
      });           
    });
  }
  List pages = [
    {
      "titulo": "Consigue tus Objetivos",
      "subtitulo": "No te preocupes si aun no tienen definidos tus objetivos. Nosotros te ayudamos a definirlos y conseguirlos",
      "image": "assets/images/on_1.png"
    },
    {
      "titulo": "Consigue tus Objetivos",
      "subtitulo": "No te preocupes si aun no tienen definidos tus objetivos. Nosotros te ayudamos a definirlos y conseguirlos",
      "image": "assets/images/on_2.png"
    },
    {
      "titulo": "Consigue tus Objetivos",
      "subtitulo": "No te preocupes si aun no tienen definidos tus objetivos. Nosotros te ayudamos a definirlos y conseguirlos",
      "image": "assets/images/on_3.png"
    },
    {
      "titulo": "Consigue tus Objetivos",
      "subtitulo": "No te preocupes si aun no tienen definidos tus objetivos. Nosotros te ayudamos a definirlos y conseguirlos",
      "image": "assets/images/on_4.png"
    }    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [

            PageView.builder(
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (context, index){
                var pObj = pages[index] as Map? ?? {};
                return OnBoardPage(pObj: pObj);
              },
            ),
            SizedBox(
              width: 120,
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      color: BColor.primaryColor1,
                      value: (selectPage + 1) / 4 ,
                      strokeWidth: 2,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(color: BColor.primaryColor1, borderRadius: BorderRadius.circular(35)),
                    child: IconButton(icon: Icon( Icons.navigate_next, color: BColor.white, ), onPressed: (){
                      if(selectPage <= 3) {          
                           selectPage = selectPage + 1;

                          controller.animateToPage(selectPage, duration: const Duration(milliseconds: 600), curve: Curves.bounceInOut);

                            setState(() {
                              
                            });
                       }else{
                        // Open Welcome Screen
                        print("Open Welcome Screen");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisrarView() ));
                      }
                      
                  },),
                ),

                
              ],
            ),
          )
        ],
      ),
    );
  }
}
