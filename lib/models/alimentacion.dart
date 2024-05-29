import 'dart:convert';

List<alimentacion> alimentacionFromJson(String str) => List<alimentacion>.from(json.decode(str).map((x) => alimentacion.fromJson(x)));

String alimentacionToJson(List<alimentacion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class alimentacion {
  int? id;
  String? comida_tiempo;
  int? id_programa;
  
  alimentacion({
    this.id,
    this.comida_tiempo,
    this.id_programa
  });
factory alimentacion.fromJson(Map<String, dynamic> json) => alimentacion(
    id: json["id"],
    comida_tiempo: json["comida_tiempo"],
    id_programa: json["id_programa"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "comida_tiempo": comida_tiempo,
    "id_programa": id_programa
  };
}