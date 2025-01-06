import 'package:flutter/material.dart';
import 'package:solo_play_application/src/main/view/recommend_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _recommend(),
            // _map(),
          ],
        ),
      ),
    );
  }

  Widget _recommend() => const RecommendView(
        key: Key("main view recommend"),
        title: "오늘은 카페투어 어떠세요?",
      );
}
