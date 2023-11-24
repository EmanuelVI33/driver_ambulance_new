import 'package:dio/dio.dart';
import 'package:driver_ambulance/feactures/mapa/domain/entities/solicitud.dart';

import '../models/solicitud_model.dart';

class SolicitudDbDatasource extends Solicitud {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://8f13-181-115-209-197.ngrok.io',
  ));

  SolicitudDbDatasource(
      {required super.nro,
      required super.latUser,
      required super.lngUser,
      required super.latScene,
      required super.lngScene,
      required super.address,
      required super.photo,
      required super.video,
      required super.descripcion,
      required super.victimsNum,
      required super.status,
      required super.createAt});

  @override
  Future<List<Solicitud>> getSolicitud() async {
    final response =
        await dio.get('/api/requests/5d17553f-7c06-4a8a-8427-0431fe033f4a');
    //final solicitudResponse = SolicitudResponse.fromJson(response.data);
    final List<Solicitud> solicitud = response.data;
    print(response.data);
    return solicitud;
  }
}
