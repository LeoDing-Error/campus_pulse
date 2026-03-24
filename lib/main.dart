import 'package:flutter/material.dart';
import 'screens/feed_screen.dart';

/// ============================================================
/// main.dart - App entry point
/// ============================================================
///
/// Every Flutter app starts here. main() calls runApp() with
/// your root widget. MaterialApp provides the Material Design
/// theme, navigation, and other framework features.
///
/// Try changing the colorSchemeSeed below and hitting
/// hot reload (Ctrl+S / Cmd+S) to see instant updates!
///

void main() {
  runApp(const CampusPulseApp());
}

class CampusPulseApp extends StatelessWidget {
  const CampusPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Pulse',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Material 3 theming - change this seed color and hot reload!
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
        // Sets the overall brightness
        brightness: Brightness.light,
      ),
      home: const FeedScreen(),
    );
  }
}
