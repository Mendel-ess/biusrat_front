import 'package:biusrat_app_fitness/common/color.dart';
import 'package:flutter/material.dart';

class CeldaTituloSubtitulo extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  const CeldaTituloSubtitulo({super.key, required this.titulo, required this.subtitulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
          color: BColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Column(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                      colors: BColor.primaryG,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)
                  .createShader(
                      Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            child: Text(
              titulo,
              style: TextStyle(
                  color: BColor.white.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          Text(
            subtitulo,
            style: TextStyle(
              color: BColor.gray,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}