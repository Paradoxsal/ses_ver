// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import '../core/services/permission_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PermissionService _permissionService = PermissionService();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    if (await _permissionService.checkAndRequestPermissions()) {
      // İzinler tamam, ana ekrana git
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // İzin hatası göster
      _showPermissionError();
    }
  }

  void _showPermissionError() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('İzin Hatası'),
        content: const Text('Uygulama için gerekli izinler verilmedi.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Uygulama Başlatılıyor...'),
          ],
        ),
      ),
    );
  }
}
