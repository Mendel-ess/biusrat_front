import 'dart:convert';

List<usuarios> usuariosFromJson(String str) => List<usuarios>.from(json.decode(str).map((x) => usuarios.fromJson(x)));

String usuariosToJson(List<usuarios> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class usuarios {
  int? id;
  String? correo;
  String? nombre;
  String? apellido;
  String? genero;
  String? password;
  String? fecha_nacimiento;
  int? peso;
  int? altura;
  int? id_programa;
  
  usuarios({
    this.id,
    this.correo,
    this.nombre,
    this.apellido,
    this.genero,
    this.password,
    this.fecha_nacimiento,
    this.peso,
    this.altura,
    this.id_programa
  });
factory usuarios.fromJson(Map<String, dynamic> json) => usuarios(
    id: json["id"],
    correo: json["correo"],
    nombre: json["nombre"],
    apellido: json["apellido"],
    genero: json["genero"],
    password: json["password"],
    fecha_nacimiento: json["fecha_nacimiento"],
    peso: json["peso"],
    altura: json["altura"],
    id_programa: json["id_programa"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "correo": correo,
    "nombre": nombre,
    "apellido": apellido,
    "genero": genero,
    "password": password,
    "fecha_nacimiento": fecha_nacimiento,
    "peso": peso,
    "altura": altura,
    "id_programa": id_programa
  };
}