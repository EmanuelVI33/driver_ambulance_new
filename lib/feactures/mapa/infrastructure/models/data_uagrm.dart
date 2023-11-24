import 'dart:convert';

import 'package:driver_ambulance/feactures/mapa/infrastructure/models/edificio.dart';

DataUagrm dataUagrmFromJson(String str) => DataUagrm.fromJson(json.decode(str));

String dataUagrmToJson(DataUagrm data) => json.encode(data.toJson());

class DataUagrm {
  List<EdificioModel> edificios;

  DataUagrm({
    required this.edificios,
  });

  factory DataUagrm.fromJson(Map<String, dynamic> json) => DataUagrm(
        edificios: List<EdificioModel>.from(
            json["features"].map((x) => EdificioModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "features": List<dynamic>.from(edificios.map((x) => x.toJson())),
      };
}
