import 'package:driver_ambulance/feactures/mapa/domain/entities/edificio.dart';

import '../models/edificio.dart';

class EdificioMapper {
  static Edificio edificioJsonToEntity(EdificioModel edificioModel) => Edificio(
      id: edificioModel.attributes.fid,
      descripcion: edificioModel.attributes.descripcio,
      codEdificio: edificioModel.attributes.codEdif,
      latitud: edificioModel.attributes.latitud,
      longitud: edificioModel.attributes.longitud,
      grupo: edificioModel.attributes.grupo,
      sigla: edificioModel.attributes.sigla,
      localidad: edificioModel.attributes.localidad);
}
