import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/common/custom_button.dart';
import '../providers/bluetooth_provider.dart';
import '../core/services/bluetooth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BluetoothService _bluetoothService = BluetoothService();
  bool _emergencyMode = false;

  @override
  void initState() {
    super.initState();
    _initializeBluetooth();
  }

  Future<void> _initializeBluetooth() async {
    await _bluetoothService.initBluetooth();
  }

  void _toggleEmergencyMode() {
    setState(() {
      _emergencyMode = !_emergencyMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acil Durum İletişim'),
        actions: [
          Switch(
            value: _emergencyMode,
            onChanged: (value) => _toggleEmergencyMode(),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_emergencyMode) ...[
            const Text(
              'Acil Durum Modu Aktif',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
          ],
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () => Navigator.pushNamed(context, '/sender'),
                    text: 'Gönderici Modu',
                    icon: Icons.send,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () => Navigator.pushNamed(context, '/receiver'),
                    text: 'Alıcı Modu',
                    icon: Icons.wifi_tethering, // Düzeltildi
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
