import 'package:dio/dio.dart';
import 'package:driver_ambulance/feactures/utils/conts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<void> sendLocation(LatLng position) async {
    try {
      // Configura la URL de tu API

      // Realiza la solicitud POST con la posición
      await _dio.patch(
          '$apiUrl/ambulance/position/a1a3a440-ff1d-4d24-8601-34a2ef1d8cc8',
          data: {
            'latitude': position.latitude,
            'longitude': position.longitude,
          });

      print('Posición enviada con éxito');
    } catch (error) {
      print('Error al enviar la posición: $error');
    }
  }
}
