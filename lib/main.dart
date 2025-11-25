import 'package:flutter/material.dart';
import 'screens/chat_home_screen.dart';
import 'screens/lock_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // DARI: home: ChatHomeScreen()
      // SEKARANG KE: LockScreen()
      home: const LockScreen(),

      // Tambahkan route supaya bisa pindah ke chat home setelah sandi benar
      routes: {
        '/home': (context) => const ChatHomeScreen(),
      },
    );
  }
}
