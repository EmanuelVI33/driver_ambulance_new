import 'package:driver_ambulance/feactures/mapa/domain/entities/edificio.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/delegates/search_edificio_delegate.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/providers/delegate/voice_text_provider.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/providers/mapa/markers_provider.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/providers/storage/local_storage_provider.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/widgets/dialog/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchDestino extends ConsumerStatefulWidget {
  final String hintText;
  final Function displayMicrophone;

  const SearchDestino(
      {super.key, required this.hintText, required this.displayMicrophone});

  @override
  SearchInputState createState() => SearchInputState();
}

class SearchInputState extends ConsumerState<SearchDestino> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textProvider = ref.watch(voiceTextProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          suffixIcon: IconButton(
              onPressed: () async {
                try {
                  final result = await showDialogVoice(context);
                  if (result != null) {
                    showDelegate(context, query: result);
                  }
                } catch (e) {
                  return;
                }
              },
              icon: const Icon(Icons.mic),
              color: Colors.grey[700]),
        ),
        textInputAction: TextInputAction.search,
        // onChanged: onChanged,
        onTap: () async {
          await showDelegate(context);
        },
      ),
    );
  }

  Future<String?> showDialogVoice(BuildContext context) async {
    String? query;

    await showDialog(
      context: context,
      builder: (context) => const ShowDialog(),
    ).then((value) {
      query = value ??
          false; // Si value es null (usuario cierra el diálogo), se considera falso.
    }).catchError(() {
      throw Exception("Error");
    });

    return query;
  }

  Future<void> showDelegate(BuildContext context, {String? query}) async {
    focusNode.unfocus();

    final localStorageRep = ref.read(localStorageRepositoryProvider);

    Edificio? edificio = await showSearch<Edificio?>(
      context: context,
      query: query,
      delegate: SearchEdifioDelegate(
        label: 'Buscar origen',
        searchEdificio: localStorageRep.getEdificio,
      ),
    );

    if (edificio != null) {
      final point = LatLng(edificio.latitud, edificio.longitud);
      ref.read(markersProvider.notifier).addOrigen(point);
      controller.text = edificio.descripcion;
    }
  }
}
