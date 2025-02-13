import 'package:flutter/foundation.dart';
import '../core/services/bluetooth_service.dart';
import '../models/device_model.dart';

class BluetoothProvider with ChangeNotifier {
  final BluetoothService _bluetoothService = BluetoothService();
  List<DeviceModel> _devices = [];
  bool _isScanning = false;

  List<DeviceModel> get devices => _devices;
  bool get isScanning => _isScanning;

  Future<void> startScan() async {
    _isScanning = true;
    notifyListeners();

    final scanResults = await _bluetoothService.scanDevices();
    _devices = scanResults
        .map((result) => DeviceModel.fromScanResult(result))
        .toList();

    _isScanning = false;
    notifyListeners();
  }

  Future<void> connectToDevice(DeviceModel device) async {
    // Cihaza bağlanma işlemi
  }
}
