class SolicitudResponse {
  final String nro;
  final String latUser;
  final String lngUser;
  final String latScene;
  final String lngScene;
  final String address;
  final String photo;
  final String video;
  final dynamic descripcion;
  final dynamic victimsNum;
  final String status;
  final DateTime createAt;

  SolicitudResponse({
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
    required this.createAt,
  });

  factory SolicitudResponse.fromJson(Map<String, dynamic> json) =>
      SolicitudResponse(
        nro: json["nro"],
        latUser: json["latUser"],
        lngUser: json["lngUser"],
        latScene: json["latScene"],
        lngScene: json["lngScene"],
        address: json["address"],
        photo: json["photo"],
        video: json["video"],
        descripcion: json["descripcion"] ?? 'Falta la descripcion',
        victimsNum: json["victimsNum"] ?? 'falta el numero de victimas',
        status: json["status"],
        createAt: DateTime.parse(json["createAt"]),
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
        "createAt": createAt.toIso8601String(),
      };
}
