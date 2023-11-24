import 'package:driver_ambulance/feactures/mapa/presentation/pages/mapa/mapa_body.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/providers/mapa/polylines_provider.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/widgets/floating_mark_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../providers/mapa/markers_provider.dart';

class MapaPage extends ConsumerStatefulWidget {
  static const routeName = 'mapa';
  const MapaPage({super.key});

  @override
  MapaPageState createState() => MapaPageState();
}

class MapaPageState extends ConsumerState<MapaPage> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  TextEditingController origenController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapaBody(textOriginController: origenController),
      floatingActionButton: FloatingMarkLocation(
        onPressed: marcarUbicacionActual,
      ),
      // floatingActionButton: Row(
      //   children: [
      //     FloatingMarkLocation(
      //       onPressed: () {},
      //     ),
      //     const SizedBox(
      //       width: 10,
      //     ),
      //     FloatingActionButton(
      //       onPressed: () {},
      //       child: const Icon(Icons.mic),
      //     )
      //   ],
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Future<String> getAddress(LatLng point) async {
    final placemarks = await placemarkFromCoordinates(
      point.latitude,
      point.longitude,
      localeIdentifier: 'es',
    );

    String ubicacion = placemarks.first.thoroughfare ?? '';

    return placemarks.first.thoroughfare == '' ? 'Ubicación actual' : ubicacion;
  }

  Future<void> marcarUbicacionActual() async {
    final permissionStatus = await Permission.location.request();
    if (permissionStatus.isGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        final latitude = position.latitude;
        final longitude = position.longitude;

        final point = LatLng(latitude, longitude);
        final address = await getAddress(point);
        ref.read(markersProvider.notifier).addDestino(point);
        ref.read(mapPolylineProvider.notifier).ocultar();
        origenController.text = address;
      } catch (e) {
        print('Error al obtener la ubicación actual: $e');
      }
    } else {
      navigatorKey.currentState?.push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Permiso de ubicación denegado'),
              content: const Text(
                  'No se puede obtener la ubicación actual porque no has concedido los permisos necesarios.'),
              actions: [
                TextButton(
                  child: const Text('Cerrar'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        ),
      );
    }
  }
}
