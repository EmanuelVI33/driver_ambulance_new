import 'package:driver_ambulance/feactures/mapa/domain/entities/edificio.dart';

abstract class LocalStorageDatasource {
  Future<List<Edificio?>> getEdificio({
    String? descripcion,
    String? localidad,
  });
}
