import 'package:driver_ambulance/feactures/mapa/presentation/providers/mapa/map_controller_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final markersProvider =
    StateNotifierProvider<MarkerNotifier, Map<String, Marker>>((ref) {
  final mapaController = ref.read(mapCreatedProvider.notifier);

  return MarkerNotifier(mapController: mapaController);
});

class MarkerNotifier extends StateNotifier<Map<String, Marker>> {
  final String origen = 'origen';
  final String destino = 'destino';
  final MapCreatedNotifier mapController;

  MarkerNotifier({required this.mapController}) : super({});

  void addOrigen(LatLng point) {
    final marker = Marker(markerId: MarkerId(origen), position: point);

    mapController.state?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 15)));

    state = {...state, origen: marker};
  }

  void addDestino(LatLng point) {
    final marker = Marker(markerId: MarkerId(destino), position: point);

    mapController.state?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 15)));

    state = {...state, destino: marker};
  }
}
