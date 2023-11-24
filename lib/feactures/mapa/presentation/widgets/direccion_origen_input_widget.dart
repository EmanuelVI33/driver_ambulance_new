import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class DireccionOrigenInputWidget extends StatelessWidget {
  const DireccionOrigenInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textFieldController;
  const TextFieldWidget({super.key, required this.textFieldController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
    );
  }
}

class SpeechAddress extends StatefulWidget {
  const SpeechAddress({super.key});

  @override
  State<SpeechAddress> createState() => _SpeechAddressState();
}

class _SpeechAddressState extends State<SpeechAddress> {
  TextEditingController _textFieldController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnable = false;
  String _lastText = '';

  void _initSpeech() async {
    _speechEnable = await _speechToText.initialize();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    if (!result.finalResult) {
      _lastText = 'No le he entiendo. ¿Puedes repetirlo?';
      _textFieldController.text = _lastText;
    } else {
      _lastText = result.recognizedWords;
      _textFieldController.text = _lastText;
    }

    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        style: const TextStyle(fontSize: 17),
        focusNode: _focusNode,
        controller: _textFieldController,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            prefix: IconButton(
              icon: const Icon(Icons.mic),
              onPressed: _speechToText.isNotListening
                  ? _startListening
                  : _stopListening,
            ),
            suffixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.only(bottom: 0.0),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            )),
        onTapOutside: (event) {
          setState(() {
            _focusNode.unfocus();
          });
        },
        onChanged: (value) {
          print('si cambio');
        },
      ),
    );
  }
}
