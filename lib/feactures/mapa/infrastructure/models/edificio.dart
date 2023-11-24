import 'dart:convert';

EdificioModel edificiosFromJson(String str) =>
    EdificioModel.fromJson(json.decode(str));

String edificiosToJson(EdificioModel data) => json.encode(data.toJson());

class EdificioModel {
  Attributes attributes;
  Geometry geometry;

  EdificioModel({
    required this.attributes,
    required this.geometry,
  });

  factory EdificioModel.fromJson(Map<String, dynamic> json) => EdificioModel(
        attributes: Attributes.fromJson(json["attributes"]),
        geometry: Geometry.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
        "geometry": geometry.toJson(),
      };
}

class Attributes {
  int fid;
  String descripcio;
  String codEdif;
  double latitud;
  double longitud;
  String grupo;
  String sigla;
  String localidad;

  Attributes({
    required this.fid,
    required this.descripcio,
    required this.codEdif,
    required this.latitud,
    required this.longitud,
    required this.grupo,
    required this.sigla,
    required this.localidad,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        fid: json["FID"],
        descripcio: json["Descripcio"],
        codEdif: json["CodEdif"],
        latitud: json["Latitud"]?.toDouble(),
        longitud: json["Longitud"]?.toDouble(),
        grupo: json["Grupo"],
        sigla: json["Sigla"],
        localidad: json["Localidad"],
      );

  Map<String, dynamic> toJson() => {
        "FID": fid,
        "Descripcio": descripcio,
        "CodEdif": codEdif,
        "Latitud": latitud,
        "Longitud": longitud,
        "Grupo": grupo,
        "Sigla": sigla,
        "Localidad": localidad,
      };
}

class Geometry {
  double x;
  double y;

  Geometry({
    required this.x,
    required this.y,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        x: json["x"]?.toDouble(),
        y: json["y"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}
