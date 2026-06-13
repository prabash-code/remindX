import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechService {
  static final stt.SpeechToText _speech = stt.SpeechToText();

  static Future<void> startListening({
    required Function(String text) onResult,
  }) async {
    bool available = await _speech.initialize();

    if (available) {
      await _speech.listen(
        onResult: (result) {
          onResult(result.recognizedWords);
        },
      );
    }
  }

  static Future<void> stopListening() async {
    await _speech.stop();
  }
}
