import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Microphone extends StatelessWidget {
  final Color color;
  final Color glowColor;
  final bool isListening;
  final Function funcion;

  const Microphone(
      {super.key,
      required this.color,
      required this.isListening,
      required this.glowColor,
      required this.funcion});

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      animate: isListening,
      endRadius: 75,
      duration: const Duration(milliseconds: 2000),
      glowColor: glowColor,
      repeat: true,
      repeatPauseDuration: const Duration(milliseconds: 100),
      showTwoGlows: true,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 35,
        child: IconButton(
          onPressed: () => funcion(),
          icon: const Icon(
            Icons.mic,
            size: 35,
          ),
          color: Colors.black,
        ),
      ),
    );
  }
}
