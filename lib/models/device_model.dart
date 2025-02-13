import 'dart:math';

class DeviceModel {
  final String id;
  final String name;
  final double distance;
  final bool isConnected;

  DeviceModel({
    required this.id,
    required this.name,
    required this.distance,
    this.isConnected = false,
  });

  factory DeviceModel.fromScanResult(dynamic scanResult) {
    return DeviceModel(
      id: scanResult.device.id.toString(),
      name: scanResult.device.name.isEmpty
          ? 'Bilinmeyen Cihaz'
          : scanResult.device.name,
      distance: _calculateDistance(scanResult.rssi),
      isConnected: false,
    );
  }

  static double _calculateDistance(int rssi) {
    // RSSI değerinden yaklaşık mesafe hesaplama
    return pow(10, (-69 - rssi) / (10 * 2)).toDouble();
  }
}
