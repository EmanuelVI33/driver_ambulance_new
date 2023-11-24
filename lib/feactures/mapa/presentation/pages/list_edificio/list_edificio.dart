import 'package:driver_ambulance/feactures/mapa/presentation/providers/storage/edificios_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListaEdificio extends ConsumerStatefulWidget {
  const ListaEdificio({super.key});

  @override
  ListaEdificioState createState() => ListaEdificioState();
}

class ListaEdificioState extends ConsumerState<ListaEdificio> {
  final textControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(edificioProvider.notifier).getEdificio();
  }

  @override
  Widget build(BuildContext context) {
    final edificios = ref.watch(edificioProvider);

    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          // SearchInput(
          //   controller: textControler,
          //   hintText: 'Buscar destino',
          //   onChanged: (value) {
          //     ref
          //         .read(edificioProvider.notifier)
          //         .getEdificio(descripcion: value);
          //   },
          // ),
          // TextFormField(
          //   controller: textControler,
          //   onChanged: (value) {
          //     ref
          //         .read(edificioProvider.notifier)
          //         .getEdificio(descripcion: value);
          //   },
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: edificios.length,
              itemBuilder: (context, index) {
                final edificio = edificios[index];
                return ListTile(
                  title: Text(edificio.descripcion),
                  subtitle: Text(edificio.localidad),
                  onTap: () {
                    textControler.text = edificio.descripcion;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('UAGRM'),
    );
  }
}
