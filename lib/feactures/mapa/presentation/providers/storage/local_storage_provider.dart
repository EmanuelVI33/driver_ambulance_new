import 'package:driver_ambulance/feactures/mapa/infrastructure/datasource/isar_datasource.dart';
import 'package:driver_ambulance/feactures/mapa/infrastructure/repository/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
