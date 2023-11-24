import 'package:driver_ambulance/feactures/mapa/domain/entities/edificio.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/widgets/delegate/item_edificio.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/widgets/dialog/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

typedef SearchEdificioCallback = Future<List<Edificio?>> Function(
    {String? descripcion, String? localidad});

class SearchEdifioDelegate extends SearchDelegate<Edificio?> {
  final String label;
  final SearchEdificioCallback searchEdificio;

  bool _isLoading = false;

  SearchEdifioDelegate({
    required this.label,
    required this.searchEdificio,
  });

  @override
  String get searchFieldLabel => label;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
                onPressed: () => query = '', icon: const Icon(Icons.clear)))
      else
        FadeIn(
          animate: query.isEmpty,
          child: IconButton(
            onPressed: () async {
              final result = await showDialogVoice(context);

              if (result != null) {
                query = result;
              }
            },
            icon: const Icon(Icons.mic),
            color: Colors.blueAccent,
          ),
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('resultados');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: _getEdificios(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          _isLoading = true;
          return _buildLoadingIndicator(); // Muestra un indicador de carga
        }

        if (snapshot.hasError) {
          return _buildErrorWidget(); // Muestra un mensaje de error si la consulta falla
        }

        _isLoading = false;

        final edificios = snapshot.data ?? [];

        return ListView.builder(
          itemCount: edificios.length,
          itemBuilder: (context, index) {
            final edificio = edificios[index];

            return ItemEdificio(
              edificio: edificio!,
              close: close,
              // addMarker: addMarker,
            );
          },
        );
      },
    );
  }

  Future<List<Edificio?>> _getEdificios() async {
    return await searchEdificio(descripcion: query);
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Text('Error al cargar los datos'),
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
      // En caso de error, se considera falso.
    });

    return query;
  }
}
