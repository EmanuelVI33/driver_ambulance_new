import 'dart:async';

import 'package:driver_ambulance/feactures/api/api_service.dart';
import 'package:driver_ambulance/feactures/mapa/domain/entities/request.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/providers/mapa/map_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../providers/mapa/polyline_travel_provider.dart';
import '../../providers/mapa/polylines_provider.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';

class MapaBody extends ConsumerStatefulWidget {
  final TextEditingController textOriginController;
  const MapaBody({super.key, required this.textOriginController});

  @override
  MapaBodyState createState() =>
      MapaBodyState(origenController: textOriginController);
}

class MapaBodyState extends ConsumerState<MapaBody> {
  GoogleMapController? mapController;
  final TextEditingController origenController; // = TextEditingController();
  Set<Marker> markers = {};
  final ApiService _apiService = ApiService();
  Timer? locationUpdateTimer;
  var data;
  Request? request;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  MapaBodyState({required this.origenController});

  @override
  void dispose() {
    // Cancela el temporizador al liberar el estado del widget
    // locationUpdateTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    listenEvent(); // Para inicializar
    // determinePosistion();
    getCurrentLocation();

    // locationUpdateTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
    //   getCurrentLocation();
    // });
  }

  void sendCurrentLocation() async {}

  void listenEvent() {
    try {
      SSEClient.subscribeToSSE(
          method: SSERequestType.GET,
          url: 'https://0000-181-115-209-197.ngrok-free.app/api/accept',
          header: {
            // "Cookie":
            //     'jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3QiLCJpYXQiOjE2NDMyMTAyMzEsImV4cCI6MTY0MzgxNTAzMX0.U0aCAM2fKE1OVnGFbgAU_UVBvNwOMMquvPY8QaLD138; Path=/; Expires=Wed, 02 Feb 2022 15:17:11 GMT; HttpOnly; SameSite=Strict',
            "Accept": "text/event-stream",
            "Cache-Control": "no-cache",
          }).listen(
        (event) {
          print(
              '--------------------------------------------------------------------------------------');
          print(
              '${event.data}-------------------------------------------------------------------------------');
          print(
              '--------------------------------------------------------------------------------------');

          if (event.data != null) {
            abrirDrawer();
            final responseMap = requestFromJson(event.data!);
            if (responseMap != null) {
              setState(() {
                request = responseMap;
                data = event.data;
              });
            }
          }

          // Recibir y almacenar
        },
        onDone: () {
          print("SSE stream closed");
        },
        onError: (error) {
          print(
              '--------------------------------------------------------------------------------------');
          print("Error en la conexión SSE: $error");
          print(
              '--------------------------------------------------------------------------------------');
        },
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  LatLng? myPosition;

  Future<Position> determinePosistion() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await determinePosistion();
    // ref
    //     .read(myLocationProvider.notifier)
    //     .update(LatLng(position.latitude, position.longitude));
    print('Update position para mandar a la API');
    myPosition = LatLng(position.latitude, position.longitude);
    // if (myPosition != null) {
    //   _apiService.sendLocation(myPosition!);
    // }
    setState(() {});
  }

  void abrirDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  String switchText = 'Desactivado';
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    final rutaPolylines = ref.watch(mapPolylineProvider);
    final polylines = ref.watch(polylineTravelProvider);
    if (myPosition != null && request != null) {
      final lat = double.parse(request!.message.latScene);
      final log = double.parse(request!.message.lngScene);
      ref
          .read(polylineTravelProvider.notifier)
          .addPolyline(myPosition!, LatLng(lat, log));
    }
    //final myLocation = ref.watch(myLocationProvider);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue, // Cambia el color de fondo del AppBar
        elevation: 4, // Agrega una sombra al AppBar
        centerTitle: true, // Centra el título en el AppBar
        titleTextStyle: const TextStyle(
          color: Colors.white, // Cambia el color del texto del título
          fontSize: 20, // Cambia el tamaño del texto del título
          fontWeight: FontWeight.bold, // Aplica negrita al texto del título
        ),
        iconTheme: const IconThemeData(
          color: Colors
              .white, // Cambia el color de los iconos (botón de retroceso, por ejemplo)
        ),
      ),
      body: myPosition == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 2,
              ),
            )
          : Stack(
              children: [
                GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  onMapCreated: (controller) => ref
                      .read(mapCreatedProvider.notifier)
                      .setMapController(controller),
                  initialCameraPosition:
                      CameraPosition(target: myPosition!, zoom: 14),
                  polylines: {polylines},
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.center, child: _getMarker())),
              ],
            ),
      drawer: request == null
          ? const NavigationDrawer(children: [
              CustomCard(
                text: 'Esperando emergencia',
                color: Colors.blue,
              ),
              Text("Esperando....")
            ])
          : NavigationDrawer(
              children: [
                Column(
                  children: [
                    CustomCard(
                      text: 'Emergencia asignada',
                      color: Colors.blue,
                    ),
                    SizedBox(
                        height: 20), // Espacio entre la tarjeta y los datos

                    // Datos de la solicitud
                    RequestInfo(
                      id: request!.message.nro,
                      description: request!.message.descripcion,
                      hospital: request!.message.entityName,
                      imageUrl: 'assets/7.jpg',
                      time: request!.message.createAt,
                    ),
                    Card(
                      margin: EdgeInsets.all(16.0),
                      elevation: 4.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Te encuentras',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      switchText =
                                          isSwitched ? 'Activo' : 'Inactivo';
                                    });
                                  },
                                  activeTrackColor: Colors.yellow,
                                  activeColor: Colors.orangeAccent,
                                  inactiveThumbColor: Colors.grey,
                                  inactiveTrackColor: Colors.grey.shade300,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              switchText,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: isSwitched
                                    ? Colors.green
                                    : Colors
                                        .red, // Cambia el color del texto según el estado del Switch
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: ClipOval(child: Image.asset("assets/profile.jpg")),
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
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;

  const CustomCard({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 6.0,
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class RequestInfo extends StatelessWidget {
  final String id;
  final String description;
  final String imageUrl;
  final DateTime time;
  final String hospital;

  const RequestInfo({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.time,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Número de solicitud: $id'),
            subtitle: Text('Tiempo: $time'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Descripción:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Hospital:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  hospital,
                  style: const TextStyle(fontSize: 14.0),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRoute extends StatelessWidget {
  const _InfoRoute({
    super.key,
    required this.selected,
    required this.ref,
  });

  final Set<TravelMode> selected;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      style: ButtonStyle(),
      segments: const [
        ButtonSegment(value: TravelMode.driving, icon: Text('vehiculo')),
        ButtonSegment(value: TravelMode.walking, icon: Text('caminando')),
      ],
      selected: selected,
      onSelectionChanged: (value) {
        ref.read(mapPolylineProvider.notifier).update(travelMode: value.first);
      },
    );
  }
}

class EmergencyInfo extends StatelessWidget {
  final Request request;

  const EmergencyInfo({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Número de solicitud: ${request.message.nro}'),
            Text('Estado: ${request.message.status}'),
            Text('Entidad: ${request.message.entityName}'),
            // Puedes seguir mostrando más detalles según tus necesidades
          ],
        ),
      ),
    );
  }
}
