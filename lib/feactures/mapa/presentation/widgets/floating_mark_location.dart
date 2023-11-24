import 'package:flutter/material.dart';

class FloatingMarkLocation extends StatelessWidget {
  final VoidCallback onPressed;

  const FloatingMarkLocation({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Colors.black87,
      backgroundColor: Colors.white,
      onPressed: onPressed,
      child: const Icon(Icons.location_searching_sharp),
    );
  }
}
