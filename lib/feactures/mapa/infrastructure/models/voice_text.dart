import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceText {
  String? _lastText; // Esta propiedad lo modifica sus métodos

  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnable = false;

  String? get lastText => _lastText;

  // Inicializar
  void initSpeech() async {
    _speechEnable = await _speechToText.initialize();
  }

  // Obtener resultados
  void onSpeechResult(SpeechRecognitionResult result) {
    _lastText = result.recognizedWords;
  }

  // Escuchar
  void startListening() async {
    _lastText = null;
    await _speechToText.listen(onResult: onSpeechResult);
  }

  // Detener grabación
  void stopListening() async {
    await _speechToText.stop();
  }

  // Si esta escuchando
  bool listening() => _speechToText.isListening;
}
