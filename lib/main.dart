// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/bluetooth_provider.dart';
import 'providers/audio_provider.dart';
import 'screens/splash_screen.dart';
import 'config/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BluetoothProvider()),
        ChangeNotifierProvider(create: (_) => AudioProvider()),
      ],
      child: MaterialApp(
        title: 'Acil Durum İletişim',
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
