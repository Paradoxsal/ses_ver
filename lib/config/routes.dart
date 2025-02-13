import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/sender_screen.dart';
import '../screens/receiver_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      '/home': (context) => const HomeScreen(),
      '/sender': (context) => const SenderScreen(),
      '/receiver': (context) => const ReceiverScreen(),
    };
  }
}