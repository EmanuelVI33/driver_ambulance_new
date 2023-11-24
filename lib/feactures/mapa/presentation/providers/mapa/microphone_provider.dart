import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  Para mostrar el microphono cuando el usuaio esta hablando
*/

// final displayMicrophone = StateProvider<bool>((ref) => false);

final displayMicrophone = StateNotifierProvider<MicrophoneNotifier, bool>(
    (ref) => MicrophoneNotifier());

class MicrophoneNotifier extends StateNotifier<bool> {
  MicrophoneNotifier() : super(false);

  void display() => state = !state;
}
