import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCreatedNotifier extends StateNotifier<GoogleMapController?> {
  MapCreatedNotifier() : super(null);

  void setMapController(GoogleMapController controller) {
    state = controller;
  }
}

final mapCreatedProvider =
    StateNotifierProvider<MapCreatedNotifier, GoogleMapController?>((ref) {
  return MapCreatedNotifier();
});
