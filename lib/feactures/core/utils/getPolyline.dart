import 'package:driver_ambulance/feactures/core/constans/constants.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetPolyline {
  static Future<List<LatLng>> getRoute(LatLng origen, LatLng destino) async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> polylineCoordinates = [];

    PolylineResult rutaPolylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(origen.latitude, origen.longitude),
      PointLatLng(destino.latitude, destino.longitude),
    );

    if (rutaPolylineResult.points.isNotEmpty) {
      for (var point in rutaPolylineResult.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    return polylineCoordinates;
  }
}
