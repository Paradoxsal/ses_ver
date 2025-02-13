// lib/screens/sender_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/bluetooth_provider.dart';
import '../providers/audio_provider.dart';
import '../widgets/device_list_item.dart';
import '../widgets/audio_recorder.dart';

class SenderScreen extends StatefulWidget {
  const SenderScreen({super.key});

  @override
  State<SenderScreen> createState() => _SenderScreenState();
}

class _SenderScreenState extends State<SenderScreen> {
  @override
  void initState() {
    super.initState();
    _startScanning();
  }

  Future<void> _startScanning() async {
    final bluetoothProvider = Provider.of<BluetoothProvider>(context, listen: false);
    await bluetoothProvider.startScan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gönderici Modu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _startScanning,
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<BluetoothProvider>(
            builder: (context, provider, child) {
              if (provider.isScanning) {
                return const Center(child: CircularProgressIndicator());
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: provider.devices.length,
                  itemBuilder: (context, index) {
                    final device = provider.devices[index];
                    return DeviceListItem(
                      device: device,
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => AudioRecorder(
                            deviceId: device.id,
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}