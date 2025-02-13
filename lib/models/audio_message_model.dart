class AudioMessageModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String audioPath;
  final DateTime timestamp;
  final bool isDelivered;

  AudioMessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.audioPath,
    required this.timestamp,
    this.isDelivered = false,
  });
}
