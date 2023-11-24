import 'package:driver_ambulance/feactures/mapa/domain/entities/solicitud.dart';

abstract class SolicitudRepository {
  Future<List<Solicitud>> getSolicitud();
}
