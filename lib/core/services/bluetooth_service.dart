import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:nearby_connections/nearby_connections.dart';

class BluetoothService {
  final Strategy strategy = Strategy.P2P_STAR;

  Future<bool> initBluetooth() async {
    try {
      // Bluetooth durumunu kontrol et
      if (await FlutterBluePlus.isAvailable) { // await ekledim
        await FlutterBluePlus.turnOn();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }


  Future<List<ScanResult>> scanDevices() async {
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));
    return await FlutterBluePlus.scanResults.first;
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await device.connect();
  }

  Future<void> sendData(BluetoothDevice device, List<int> data) async {
    // Veri gönderme işlemi burada yapılacak
  }
}
