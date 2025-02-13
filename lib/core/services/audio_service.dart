import 'package:record/record.dart';
import 'package:just_audio/just_audio.dart';

class AudioService {
  final AudioRecorder _audioRecorder = AudioRecorder(); // Record yerine AudioRecorder
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> startRecording(String path) async {
    // İzin kontrolü için permission_handler kullanın
    if (await _audioRecorder.hasPermission()) {
      await _audioRecorder.start(const RecordConfig(), path: path); // Gerekli parametreler eklendi
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