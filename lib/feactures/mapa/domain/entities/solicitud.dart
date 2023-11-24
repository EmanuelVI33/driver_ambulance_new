class Solicitud {
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

  Solicitud({
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
}
