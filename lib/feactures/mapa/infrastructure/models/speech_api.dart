import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechApi {
  static final _speech = SpeechToText();
  static bool _validationCompleted = false;

  static Future<bool> toggleRecording({
    required Function(String text) onResult,
    required ValueChanged<bool> onListening,
  }) async {
    if (_speech.isListening) {
      _speech.stop();
      return true;
    }

    final isAvailable = await _speech.initialize(
      onStatus: (status) => onListening(_speech.isListening),
      onError: (e) => print('Error: $e'),
    );

    if (isAvailable) {
      _speech.listen(
        onResult: (value) {
          final recognizedWords = value.recognizedWords;
          onResult(recognizedWords);

          // Verificar si se ha reconocido alguna palabra y la validación aún no se ha completado
          if (recognizedWords.isNotEmpty && !_validationCompleted) {
            _validationCompleted = true;
            _speech.stop();
          } else if (!_speech.isListening) {
            // Si la escucha se detuvo y no se reconoció ninguna palabra, mostrar mensaje
            print("No se detectaron palabras.");
          }
        },
      );
    }

    return isAvailable;
  }
}
