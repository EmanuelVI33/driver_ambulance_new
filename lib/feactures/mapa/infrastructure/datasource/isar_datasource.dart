import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/datasource/local_storage_datasource.dart';
import '../../domain/entities/edificio.dart';
import '../mappers/edificio_mapper.dart';
import '../models/data_uagrm.dart';
import '../models/edificio.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final prefs = await SharedPreferences.getInstance();
    final bool dataLoaded = prefs.getBool('dataLoaded') ?? false;

    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open([EdificioSchema],
          inspector: true, directory: dir.path);

      if (!dataLoaded) {
        await loadData(isar);
        prefs.setBool('dataLoaded', true);
      }

      return isar;
    }

    return Future.value(Isar.getInstance());
  }

  Future<void> loadData(Isar isar) async {
    final String jsonString = await rootBundle.loadString('assets/uagrm.json');
    final jsonData = json.decode(jsonString) as Map<String, dynamic>;

    // Cargar lista de edificio desde uagrm.json
    List<EdificioModel> edificiosModel = DataUagrm.fromJson(jsonData).edificios;
    List<Edificio> edificios = [];

    for (var edificio in edificiosModel) {
      edificios.add(EdificioMapper.edificioJsonToEntity(edificio));
    }

    await isar.writeTxn(() async => await isar.edificios.putAll(edificios));
  }

  @override
  Future<List<Edificio>> getEdificio({
    String? descripcion,
    String? localidad,
  }) async {
    final isar = await db;

    var result = isar.edificios
        .filter()
        .optional(descripcion != null,
            (q) => q.descripcionContains(descripcion!, caseSensitive: false))
        .optional(localidad != null,
            (q) => q.localidadEqualTo(localidad!, caseSensitive: false))
        .findAll();

    return result;
  }
}
