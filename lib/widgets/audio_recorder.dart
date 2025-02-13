import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';

class AudioRecorder extends StatelessWidget {
  final String deviceId;

  const AudioRecorder({
    super.key,
    required this.deviceId,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                provider.isRecording ? 'Kaydediliyor...' : 'Kayıt için basılı tutun',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onLongPressStart: (_) => provider.startRecording(),
                onLongPressEnd: (_) => provider.stopRecording(),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: provider.isRecording ? Colors.red : Colors.blue,
                  ),
                  child: Icon(
                    provider.isRecording ? Icons.mic : Icons.mic_none,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}