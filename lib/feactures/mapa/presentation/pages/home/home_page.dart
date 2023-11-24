import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/home/option_item.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Ambulancia Ya'),
              Image.network(
                  'https://www.pngkit.com/png/detail/251-2511622_ambulance-drawing-side-view-ambulance-cartoon.png'),
              const Icon(
                Icons.emergency,
                size: 40,
                color: Colors.red,
              ),
              // Agregar las dos opciones
              const OptionItem(
                optionText: 'Historial de Viaje',
                icon: Icons.check,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: const OptionItem(
                  optionText: 'Solicitar Ambulancia',
                  icon: Icons.settings,
                ),
                onTap: () {
                  context.push('/solicitud');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
