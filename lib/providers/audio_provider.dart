import 'package:flutter/foundation.dart';
import '../core/services/audio_service.dart';
import '../models/audio_message_model.dart';

class AudioProvider with ChangeNotifier {
  final AudioService _audioService = AudioService();
  List<AudioMessageModel> _messages = [];
  bool _isRecording = false;

  List<AudioMessageModel> get messages => _messages;
  bool get isRecording => _isRecording;

  Future<void> startRecording() async {
    _isRecording = true;
    notifyListeners();

    final String path = await _getAudioPath();
    await _audioService.startRecording(path);
  }

  Future<void> stopRecording() async {
    await _audioService.stopRecording();
    _isRecording = false;
    notifyListeners();
  }

  Future<String> _getAudioPath() async {
    // Ses dosyası için path oluşturma
    return 'path/to/audio/file.m4a';
  }
}
