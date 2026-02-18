import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';

void main() {
  runApp(const WastellyApp());
}

class WastellyApp extends StatelessWidget {
  const WastellyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wastelly Eco Donation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D32)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(),
    );
  }
}

// ─────────────────────────── SHARED LOGO WIDGET ───────────────────────────
class WastellyLogo extends StatelessWidget {
  final double size;
  const WastellyLogo({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(-1.0, 1.0),
          child: Image.asset(
            'assets/images/wastella_white.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
