import 'dart:math';

import 'package:driver_ambulance/feactures/mapa/presentation/providers/mapa/ruta_polyline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_webservice/places.dart' as map;

import '../../../../core/constans/constants.dart';
import 'markers_provider.dart';

final mapPolylineProvider =
    StateNotifierProvider<PolylineNotifier, RutaPolyline>((ref) {
  final marker = ref.watch(markersProvider);
  return PolylineNotifier(marker: marker);
});

class PolylineNotifier extends StateNotifier<RutaPolyline> {
  final marker;
  Duration? durationDriver;
  Duration? durationWalking;
  double? distanceDriver;
  double? distanceWalking;
  List<Point>? polylineCoordinates;

  PolylineNotifier({required this.marker})
      : super(RutaPolyline(travelMode: TravelMode.driving, travelSelec: false));

  Future<void> update({TravelMode travelMode = TravelMode.driving}) async {
    var rutaPolyline = state.copyWith(travelMode: travelMode);
    if (marker['origen'] != null && marker['destino'] != null) {
      PolylinePoints polylinePoints = PolylinePoints();
      LatLng origen = marker["origen"]!.position;
      LatLng destino = marker["destino"]!.position;
      List<LatLng> polylineCoordinates = [];

      PolylineResult rutaPolylineResult =
          await polylinePoints.getRouteBetweenCoordinates(
              google_api_key,
              PointLatLng(origen.latitude, origen.longitude),
              PointLatLng(destino.latitude, destino.longitude),
              travelMode: rutaPolyline.travelMode!);

      if (rutaPolylineResult.points.isNotEmpty) {
        for (var point in rutaPolylineResult.points) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        }
      }

      // Caluclar distancia
      calculateDistanceRoute(polylineCoordinates, travelMode);

      List<PatternItem> polylinePattern = [
        PatternItem.dash(10),
        PatternItem.gap(5)
      ];

      Set<Polyline> polylines = {};
      polylines.add(Polyline(
          polylineId: const PolylineId('1'),
          points: polylineCoordinates,
          width: 4,
          color: Colors.blue,
          patterns: (travelMode == TravelMode.walking) ? polylinePattern : []));

      state = rutaPolyline.copyWith(
          origen: origen,
          destino: destino,
          polylines: polylines,
          durationDriver: durationDriver,
          durationWalking: durationWalking,
          travelSelec: true);
    }
  }

  String? getDuration(TravelMode travelMode) {
    Duration? duration = TravelMode.driving == travelMode
        ? state.durationDriver
        : state.durationWalking;

    if (duration == null) return '';

    if (duration.inMinutes < 60) {
      return '${duration.inMinutes} min';
    } else {
      int hours = duration.inHours;
      int minutes = duration.inMinutes.remainder(60);
      return '${hours}h ${minutes}min';
    }
  }

  String? getDistanceWalking() => state.durationWalking?.inMinutes.toString();

  String? getDistanceDriver() => state.durationDriver?.inMinutes.toString();

  void calculateDistanceRoute(
      List<LatLng> pointList, TravelMode travelMode) async {
    // PolylinePoints polylinePoints = PolylinePoints();
    // LatLng origen = route.origen!;
    // LatLng destination = route.destination!;

    // List<LatLng> polylineCoordinates = [];

    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //   google_api_key,
    //   PointLatLng(origen.latitude, origen.longitude),
    //   PointLatLng(destination.latitude, destination.longitude),
    //   travelMode: travelMode,
    // );

    // if (result.points.isNotEmpty) {
    //   for (var point in result.points) {
    //     polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    //   }
    // }

    double totalDistance = 0;
    for (var i = 0; i < pointList.length - 1; i++) {
      totalDistance += calculateDistance(
          pointList[i].latitude,
          pointList[i].longitude,
          pointList[i + 1].latitude,
          pointList[i + 1].longitude);
    }

    // Asignar tiempo al mode de viaje
    if (travelMode == TravelMode.driving) {
      distanceDriver = totalDistance;
      durationDriver = getTime(distanceDriver!, travelMode);
    } else {
      distanceWalking = totalDistance;
      durationWalking = getTime(distanceWalking!, travelMode);
    }

    // return Polyline(polylineId: PolylineId('$id'), points: polylineCoordinates);
  }

  // Recibe en KM
  Duration getTime(double distance, TravelMode travelMode) {
    // distance *= 1000; // Convertir a metros

    double estimatedSpeed;
    if (travelMode == TravelMode.driving) {
      estimatedSpeed = 30; // Velocidad estimada en km/h para un vehículo
    } else {
      estimatedSpeed = 3; // Velocidad estimada en km/h para caminar
    }

    final estimatedDuration =
        (distance / estimatedSpeed) * 3600; // Duración en segundos

    return Duration(seconds: estimatedDuration.round());
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void ocultar() {
    state = state.copyWith(travelSelec: false);
  }
}





// final mapPolylineProvider = FutureProvider<Set<Polyline>>((ref) async {
//   Set<Polyline> polylines = {};
//   final marker = ref.watch(markersProvider);
//   //debugPrint("esta por aqui ->");
  
//   if(marker['origen'] == null || marker['destino'] == null){
//     debugPrint("---------->"+(marker['origen'] == null || marker['destino'] == null).toString());
//     return polylines;
    
//   } 

//   const travelMode = TravelMode.driving;
//   PolylinePoints polylinePoints = PolylinePoints();
//   LatLng origen = marker["origen"]!.position;
//   LatLng destino = marker["destinno"]!.position;
//   List<LatLng> polylineCoordinates = [];
  
//   debugPrint("-------------------x esta por aqui");
//   PolylineResult rutaPolylineResult = await polylinePoints.getRouteBetweenCoordinates(
//     google_api_key,
//     PointLatLng(origen.latitude, origen.longitude), 
//     PointLatLng(destino.latitude, destino.longitude), 
//     travelMode: travelMode
//   );

//   if (rutaPolylineResult.points.isNotEmpty) {
//     for (var point in rutaPolylineResult.points) {
//       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//     }
//   }
  
//   polylines.add(Polyline(
//     polylineId: PolylineId('1'), 
//     points: polylineCoordinates,
//     width: 4,
//     color: Colors.blue,
//   ));
//   return polylines;
// });

