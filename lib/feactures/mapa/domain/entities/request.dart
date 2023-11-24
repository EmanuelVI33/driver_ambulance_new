import 'dart:convert';

Request? requestFromJson(String str) {
  try {
    return Request.fromJson(json.decode(str));
  } catch (e) {
    print(
        '--------------------------------------------------------------------------------------');
    print('Error $e');
    print(
        '--------------------------------------------------------------------------------------');
    return null;
  }
}

String requestToJson(Request data) => json.encode(data.toJson());

class Request {
  Message message;

  Request({
    required this.message,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        message: Message.fromJson(json["message"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message.toJson(),
      };
}

class Message {
  String nro;
  String latUser;
  String lngUser;
  String latScene;
  String lngScene;
  String address;
  String photo;
  String video;
  dynamic descripcion;
  dynamic victimsNum;
  String status;
  String entityName;
  EntityCoordenada entityCoordenada;
  DateTime createAt;
  List<Ambulance> ambulances;

  Message({
    required this.nro,
    required this.latUser,
    required this.lngUser,
    required this.latScene,
    required this.lngScene,
    required this.address,
    required this.photo,
    required this.video,
    required this.descripcion,
    required this.victimsNum,
    required this.status,
    required this.entityName,
    required this.entityCoordenada,
    required this.createAt,
    required this.ambulances,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        nro: json["nro"],
        latUser: json["latUser"],
        lngUser: json["lngUser"],
        latScene: json["latScene"],
        lngScene: json["lngScene"],
        address: json["address"] ?? "",
        photo: json["photo"] ?? "",
        video: json["video"] ?? "",
        descripcion: json["descripcion"] ?? "",
        victimsNum: json["victimsNum"] ?? 1,
        status: json["status"] ?? "Pendiente",
        entityName: json["entityName"],
        entityCoordenada: EntityCoordenada.fromJson(json["entityCoordenada"]),
        createAt: DateTime.parse(json["createAt"]),
        ambulances: List<Ambulance>.from(
            json["ambulances"].map((x) => Ambulance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nro": nro,
        "latUser": latUser,
        "lngUser": lngUser,
        "latScene": latScene,
        "lngScene": lngScene,
        "address": address,
        "photo": photo,
        "video": video,
        "descripcion": descripcion,
        "victimsNum": victimsNum,
        "status": status,
        "entityName": entityName,
        "entityCoordenada": entityCoordenada.toJson(),
        "createAt": createAt.toIso8601String(),
        "ambulances": List<dynamic>.from(ambulances.map((x) => x.toJson())),
      };
}

class Ambulance {
  String id;
  String plate;
  String latStop;
  String lngStop;
  String latCurrent;
  String lngCurrent;
  bool isActive;
  bool isIdle;
  DateTime createAt;

  Ambulance({
    required this.id,
    required this.plate,
    required this.latStop,
    required this.lngStop,
    required this.latCurrent,
    required this.lngCurrent,
    required this.isActive,
    required this.isIdle,
    required this.createAt,
  });

  factory Ambulance.fromJson(Map<String, dynamic> json) => Ambulance(
        id: json["id"],
        plate: json["plate"] ?? "gfr432",
        latStop: json["latStop"],
        lngStop: json["lngStop"],
        latCurrent: json["latCurrent"],
        lngCurrent: json["lngCurrent"],
        isActive: json["isActive"] ?? true,
        isIdle: json["isIdle"] ?? true,
        createAt: DateTime.parse(json["createAt"]) ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plate": plate,
        "latStop": latStop,
        "lngStop": lngStop,
        "latCurrent": latCurrent,
        "lngCurrent": lngCurrent,
        "isActive": isActive,
        "isIdle": isIdle,
        "createAt": createAt.toIso8601String(),
      };
}

class EntityCoordenada {
  double lat;
  double lng;

  EntityCoordenada({
    required this.lat,
    required this.lng,
  });

  factory EntityCoordenada.fromJson(Map<String, dynamic> json) =>
      EntityCoordenada(
        lat: json["lat"]?.toDouble() ?? "-17.783886",
        lng: json["lng"]?.toDouble() ?? "-63.181480",
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}
