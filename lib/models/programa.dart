import 'dart:convert';

List<programa> programaFromJson(String str) => List<programa>.from(json.decode(str).map((x) => programa.fromJson(x)));

String programaToJson(List<programa> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class programa {
  int? id;
  String? nombre_programa;
  String? descrip_programa;
  String? image;
  
  programa({
    this.id,
    this.nombre_programa,
    this.descrip_programa,
    this.image
  });
factory programa.fromJson(Map<String, dynamic> json) => programa(
    id: json["id"],
    nombre_programa: json["nombre_programa"],
    descrip_programa: json["descrip_programa"],
    image: json["image"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre_programa": nombre_programa,
    "descrip_programa": descrip_programa,
    "image": image
  };
}