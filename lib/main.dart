import 'package:flutter/material.dart';
import 'package:solo_play_application/src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const App(),
      debugShowCheckedModeBanner: false,
    );
  }
}
