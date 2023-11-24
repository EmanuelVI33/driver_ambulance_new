import 'package:driver_ambulance/feactures/mapa/domain/entities/solicitud.dart';

import '../models/solicitud_model.dart';

class SolicitudMapper {
  static Solicitud movieDBToEntity(SolicitudResponse solicitudDb) => Solicitud(
      nro: solicitudDb.nro,
      latUser: solicitudDb.latUser,
      lngUser: solicitudDb.latUser,
      latScene: solicitudDb.latScene,
      lngScene: solicitudDb.lngScene,
      address: solicitudDb.address,
      photo: solicitudDb.photo,
      video: solicitudDb.video,
      descripcion: (solicitudDb.descripcion == null)
          ? 'no description'
          : solicitudDb.descripcion,
      victimsNum: (solicitudDb.victimsNum == null)
          ? 'no vict'
          : solicitudDb.descripcion,
      createAt: solicitudDb.createAt,
      status: solicitudDb.status);
}
