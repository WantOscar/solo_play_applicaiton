import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solo_play_application/src/features/course/presentation/pages/course_ranking_page.dart';
import 'package:solo_play_application/src/features/place/pages/place_ranking_page.dart';

class RankUI extends HookWidget {
  const RankUI({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 2);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          title: const Text(
            '이번 주 핫플 순위',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          bottom: TabBar.secondary(
            controller: controller,
            labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
            labelColor: Colors.black,
            unselectedLabelColor: const Color(0xff8E8E8E),
            unselectedLabelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
            tabs: const [
              Tab(
                text: '장소',
              ),
              Tab(
                text: '코스',
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          PlaceRankingPage(),
          CourseRankingPage(),
        ],
      ),
    );
  }
}
