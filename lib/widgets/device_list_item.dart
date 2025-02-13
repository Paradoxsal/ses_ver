// lib/widgets/device_list_item.dart
import 'package:flutter/material.dart';
import '../models/device_model.dart';

class DeviceListItem extends StatelessWidget {
  final DeviceModel device;
  final VoidCallback onTap;

  const DeviceListItem({
    super.key,
    required this.device,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(device.name),
      subtitle: Text('Mesafe: ${device.distance.toStringAsFixed(2)} metre'),
      trailing: Icon(
        device.isConnected ? Icons.bluetooth_connected : Icons.bluetooth,
        color: device.isConnected ? Colors.blue : Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
