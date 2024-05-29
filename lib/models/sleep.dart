import 'dart:convert';

List<Sleep> SleepFromJson(String str) => List<Sleep>.from(json.decode(str).map((x) => Sleep.fromJson(x)));

String SleepToJson(List<Sleep> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sleep {
  int? id;
  String? hora_acostarse;
  String? hora_levantarse;
  int? cant_horas;
  int? id_usuario;
  
  Sleep({
    this.id,
    this.hora_acostarse,
    this.hora_levantarse,
    this.cant_horas,
    this.id_usuario
  });
  
factory Sleep.fromJson(Map<String, dynamic> json) => Sleep(
    id: json["id"],
    hora_acostarse: json["hora_acostarse"],
    hora_levantarse: json["hora_levantarse"],
    cant_horas: json["cant_horas"],
    id_usuario: json["id_usuario"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hora_acostarse": hora_acostarse,
    "hora_levantarse": hora_levantarse,
    "cant_horas": cant_horas,
    "id_usuario": id_usuario
  };
}