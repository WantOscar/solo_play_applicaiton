import 'package:flutter/material.dart';
import 'package:solo_play_application/src/views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
