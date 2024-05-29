import 'dart:convert';

List<entrenamiento> entrenamientoFromJson(String str) => List<entrenamiento>.from(json.decode(str).map((x) => entrenamiento.fromJson(x)));

String entrenamientoToJson(List<entrenamiento> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class entrenamiento {
  int? id;
  String? tipo_entrenamiento;
  String? dificultad;
  int? id_programa;
  
  entrenamiento({
    this.id,
    this.tipo_entrenamiento,
    this.dificultad,
    this.id_programa
  });
factory entrenamiento.fromJson(Map<String, dynamic> json) => entrenamiento(
    id: json["id"],
    tipo_entrenamiento: json["tipo_entrenamiento"],
    dificultad: json["dificultad"],
    id_programa: json["id_programa"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo_entrenamiento": tipo_entrenamiento,
    "dificultad": dificultad,
    "id_programa": id_programa
  };
}