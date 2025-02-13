// lib/screens/receiver_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';
import '../models/audio_message_model.dart';

class ReceiverScreen extends StatefulWidget {
  const ReceiverScreen({super.key});

  @override
  State<ReceiverScreen> createState() => _ReceiverScreenState();
}

class _ReceiverScreenState extends State<ReceiverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alıcı Modu'),
      ),
      body: Consumer<AudioProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.messages.length,
            itemBuilder: (context, index) {
              final message = provider.messages[index];
              return ListTile(
                title: Text('Gönderen: ${message.senderId}'),
                subtitle: Text(
                  'Mesaj Zamanı: ${message.timestamp.toString()}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    // Ses mesajını oynat
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}