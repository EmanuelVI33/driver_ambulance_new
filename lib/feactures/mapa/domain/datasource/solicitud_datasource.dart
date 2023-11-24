import 'package:driver_ambulance/feactures/mapa/domain/entities/solicitud.dart';

abstract class SolicitudDatasource {
  Future<List<Solicitud>> getNowPlaying();
}
