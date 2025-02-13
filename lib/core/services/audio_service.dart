import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  final Record _audioRecorder = Record();
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> startRecording(String path) async {
    if (await _audioRecorder.hasPermission()) {
      await _audioRecorder.start(path: path);
    }
  }

  Future<void> stopRecording() async {
    await _audioRecorder.stop();
  }

  Future<void> playAudio(String path) async {
    await _audioPlayer.setFilePath(path);
    await _audioPlayer.play();
  }
}