import 'package:flutter_riverpod/flutter_riverpod.dart';

final voiceTextProvider = StateNotifierProvider<VoiceTextNotifier, String?>(
    (ref) => VoiceTextNotifier());

class VoiceTextNotifier extends StateNotifier<String?> {
  VoiceTextNotifier() : super(null);

  void init() {
    state = null;
  }

  void setText(String text) {
    state = text;
  }
}
