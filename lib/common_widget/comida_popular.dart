import 'package:biusrat_app_fitness/common/color.dart';
import 'package:flutter/material.dart';


class ComidaPopular extends StatelessWidget {
  final Map mObj;
  const ComidaPopular({super.key, required this.mObj});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: BColor.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            Image.asset(
              mObj["image"].toString(),
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mObj["name"].toString(),
                    style: TextStyle(
                        color: BColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${mObj["size"]} | ${mObj["time"]} | ${mObj["kcal"]}",
                    style: TextStyle(color: BColor.gray, fontSize: 12),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/next_icon.png",
                width: 25,
                height: 25,
              ),
            )
          ],
        ));
  }
}