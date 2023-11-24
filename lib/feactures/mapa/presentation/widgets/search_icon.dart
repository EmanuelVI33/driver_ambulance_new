import 'package:flutter/material.dart';

class IconSearch extends StatelessWidget {
  const IconSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(),
            ),
        icon: const Icon(Icons.mic),
        color: Colors.grey[700]);
  }
}
