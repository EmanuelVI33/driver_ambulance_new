import 'package:driver_ambulance/feactures/mapa/domain/datasource/solicitud_datasource.dart';
import 'package:driver_ambulance/feactures/mapa/domain/entities/solicitud.dart';
import 'package:driver_ambulance/feactures/mapa/domain/repository/solicitud_repository.dart';

class SolicitudRepositoryImpl extends SolicitudRepository {
  final SolicitudDatasource datasource;
  SolicitudRepositoryImpl(this.datasource);

  @override
  Future<List<Solicitud>> getSolicitud() {
    return datasource.getNowPlaying();
  }
}
