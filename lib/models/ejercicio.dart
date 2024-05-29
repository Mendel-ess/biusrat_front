import 'dart:convert';

List<ejercicio> ejercicioFromJson(String str) => List<ejercicio>.from(json.decode(str).map((x) => ejercicio.fromJson(x)));

String ejercicioToJson(List<ejercicio> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ejercicio {
  int? id;
  String? nombre_ejercicio;
  int? descrip_ejercicio;
  int? serie;
  int? repeticion;
  int? peso;
  int? id_entrenamiento;
  
  ejercicio({
    this.id,
    this.nombre_ejercicio,
    this.descrip_ejercicio,
    this.serie,
    this.repeticion,
    this.peso,
    this.id_entrenamiento
  });
factory ejercicio.fromJson(Map<String, dynamic> json) => ejercicio(
    id: json["id"],
    nombre_ejercicio: json["nombre_ejercicio"],
    descrip_ejercicio: json["descrip_ejercicio"],
    serie: json["serie"],
    repeticion: json["repeticion"],
    peso: json["peso"],
    id_entrenamiento: json["id_entrenamiento"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre_ejercicio": nombre_ejercicio,
    "descrip_ejercicio": descrip_ejercicio,
    "serie": serie,
    "repeticion": repeticion,
    "peso": peso,
    "id_entrenamiento": id_entrenamiento
  };
}