import 'dart:typed_data';

import 'package:driver_ambulance/feactures/core/utils/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class SolicitudScreen extends StatefulWidget {
  static const routeName = 'solicitud';
  const SolicitudScreen({super.key});

  @override
  State<SolicitudScreen> createState() => _SolicitudScreenState();
}

class _SolicitudScreenState extends State<SolicitudScreen> {
  Uint8List? _file;
  late GoogleMapController mapController;

  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Subir imagen '),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Tomar fotografia'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  try {
                    Uint8List? file = await pickImage(ImageSource.camera);

                    if (file != null) {
                      setState(() {
                        _file = file;
                      });
                    }
                  } catch (e) {
                    // Manejar cualquier excepción que pueda ocurrir durante la selección de la imagen
                    print('Error al seleccionar la imagen: $e');
                  }
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Seleccionar de la galeria'),
                onPressed: () async {
                  Navigator.of(context).pop();

                  try {
                    Uint8List? file = await pickImage(ImageSource.gallery);

                    if (file != null) {
                      setState(() {
                        _file = file;
                      });
                    }
                  } catch (e) {
                    // Manejar cualquier excepción que pueda ocurrir durante la selección de la imagen
                    print('Error al seleccionar la imagen: $e');
                  }
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Cancelar'),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Icon(
            Icons.local_hospital,
            color: colors.primary,
            size: 35,
          )
        ],
        title: const Text('Solictud de emergencia'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '¿En que podemos ayudarte?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                // Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: Text(
                //     'Describe tu emergencia',
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Describe tu emergencia',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    maxLines: 5,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Seleccione la ubicacion',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Stack(children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    right: 80,
                    child: IconButton(
                      icon: const Icon(Icons.location_on),
                      onPressed: () => context.go('/mapa'),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(37.42796133580664, -122.085749655962),
                        zoom: 14.0,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                    ),
                  ),
                ]),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Cargar imagenes de la emergencia',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                if (_file != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.memory(
                              _file!,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: GestureDetector(
                            onTap:
                                clearImage, // Reemplaza clearImage con tu función para borrar la imagen
                            child: Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_file == null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        Positioned(
                          top: 90,
                          right: 80,
                          child: IconButton(
                            icon: const Icon(Icons.upload),
                            onPressed: () => _selectImage(context),
                          ),
                        ),
                      ],
                    ),
                  ),

                /*Center(
                  child: ElevatedButton(
                    onPressed: () => _selectImage(context),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Color de fondo del botón
                      elevation: 3, // Elevación del botón
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Bordes redondeados
                      ),
                      padding: EdgeInsets.all(10), // Espaciado interno
                    ),
                    child: Text(
                      'Subir imagen',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Tamaño del texto
                        fontWeight: FontWeight.bold, // Peso del texto
                      ),
                    ),
                  ),
                ),*/

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CustomButton(
                          text: 'Cancelar',
                          color: Colors.red,
                          onPressed: () => context.go('/home'),
                        )),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: 'Enviar',
                        color: Colors.green,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: Text('Solicitud enviada'),
                                    content: Text(
                                        'Su solicitud esta siendo tratada'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context.go('/mapa');
                                        },
                                        child: Text('Aceptar'),
                                      )
                                    ]);
                              });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(3),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
