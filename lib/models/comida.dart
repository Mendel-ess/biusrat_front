import 'dart:convert';

List<comida> comidaFromJson(String str) => List<comida>.from(json.decode(str).map((x) => comida.fromJson(x)));

String comidaToJson(List<comida> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class comida {
  int? id;
  String? nombre_plato;
  int? calorias;
  int? cant_proteinas;
  int? cant_carbo;
  int? cant_grasas;
  int? id_alimentacion;
  
  comida({
    this.id,
    this.nombre_plato,
    this.calorias,
    this.cant_carbo,
    this.cant_proteinas,
    this.cant_grasas,
    this.id_alimentacion
  });
factory comida.fromJson(Map<String, dynamic> json) => comida(
    id: json["id"],
    nombre_plato: json["nombre_plato"],
    calorias: json["calorias"],
    cant_carbo: json["cant_carbo"],
    cant_grasas: json["cant_grasas"],
    cant_proteinas: json["cant_proteinas"],
    id_alimentacion: json["id_alimentacion"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre_plato": nombre_plato,
    "calorias": calorias,
    "cant_carbo": cant_carbo,
    "cant_grasas": cant_grasas,
    "cant_proteinas": cant_proteinas,
    "id_alimentacion": id_alimentacion
  };
}