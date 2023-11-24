import 'package:driver_ambulance/feactures/core/utils/getPolyline.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'polyline_travel_provider.g.dart';

@riverpod
class PolylineTravel extends _$PolylineTravel {
  final id = "route";

  @override
  Polyline build() {
    return Polyline(polylineId: PolylineId(id));
  }

  addPolyline(LatLng origen, LatLng destino) async {
    if (origen != null && destino != null) {
      final polylineCoordinates = await GetPolyline.getRoute(origen, destino);
      state = (Polyline(
          polylineId: PolylineId(id),
          points: polylineCoordinates,
          width: 3,
          color: Colors.blue));
    }
  }
}
