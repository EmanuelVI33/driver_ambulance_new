import 'dart:async';

import 'package:driver_ambulance/feactures/mapa/infrastructure/models/speech_api.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/providers/delegate/voice_text_provider.dart';
import 'package:driver_ambulance/feactures/mapa/presentation/widgets/microphone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ShowDialog extends ConsumerStatefulWidget {
  const ShowDialog({super.key});

  @override
  ShowDialogState createState() => ShowDialogState();
}

class ShowDialogState extends ConsumerState<ShowDialog>
    with SingleTickerProviderStateMixin {
  String? resultText;
  String msg = 'Presiona el microfono y empieza a hablar';
  bool isListening = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Navegar a otra pantalla si resultText no es null
          if (resultText != null) {
            context.pop(resultText);
          }
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(color: Colors.white);

    Future toggleRecording() async {
      await SpeechApi.toggleRecording(
        onResult: (text) {
          ref.read(voiceTextProvider.notifier).setText(text);
          resultText = text;

          setState(() {});

          // Mostrar el resultado durante 2 segundos antes de navegar
          _animationController.forward(from: 0.0);
        },
        onListening: (isListening) {
          setState(() => this.isListening = isListening);
        },
      );
    }

    return AlertDialog(
      title: Text(
        'UAGRM',
        textAlign: TextAlign.center,
        style: style,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Microphone(
            color: Colors.blueAccent,
            glowColor: Colors.blueAccent[400]!,
            isListening: isListening,
            funcion: () {
              toggleRecording();
            },
          ),
          Text(
            resultText == null ? msg : resultText!,
            style: style,
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
