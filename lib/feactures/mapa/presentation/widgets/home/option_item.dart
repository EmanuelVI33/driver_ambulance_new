import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OptionItem extends StatelessWidget {
  final String optionText;
  final IconData icon;

  const OptionItem({
    Key? key,
    required this.optionText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go('/solicitud'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.blue, // Puedes personalizar el color aquí
          ),
          const SizedBox(
              width: 8), // Añade un espacio entre el icono y el texto
          Text(
            optionText,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
