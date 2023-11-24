import 'package:isar/isar.dart';

part 'edificio.g.dart';

@collection
class Edificio {
  Id? isarId;

  int id;
  String descripcion;
  String codEdificio;
  double latitud;
  double longitud;
  String grupo;
  String sigla;
  String localidad;

  Edificio({
    required this.id,
    required this.descripcion,
    required this.codEdificio,
    required this.latitud,
    required this.longitud,
    required this.grupo,
    required this.sigla,
    required this.localidad,
  });
}
