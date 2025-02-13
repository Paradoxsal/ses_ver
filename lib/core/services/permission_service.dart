// lib/core/services/permission_service.dart
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> checkAndRequestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothAdvertise,
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.location,
      Permission.microphone,
      Permission.notification,
      Permission.storage,
    ].request();

    bool allGranted = true;
    statuses.forEach((permission, status) {
      if (!status.isGranted) allGranted = false;
    });

    return allGranted;
  }
}