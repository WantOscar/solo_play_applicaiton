import 'package:flutter/material.dart';
import 'package:solo_play_application/src/core/widgets/primary_badge_widget.dart';
import 'package:solo_play_application/src/features/home/presentation/widgets/place_card_widget.dart';

class RecommandPlaceView extends StatelessWidget {
  const RecommandPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffFFFFFF),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "낭만님!",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF0070F0),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "오늘은 이런 공간 어때요?",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "오늘은 이런 공간 어때요?",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF000000),
              ),
            ),
            Text(
              "혼자는 아직 어색한 쓰꾸삐님을 위해 준비했어요",
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF000000),
              ),
            ),
            SizedBox(height: 4),
            PrimaryBadgeWidget(text: "Lv. 1 혼자는 아직 힘들어"),
            SizedBox(height: 8),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return PlaceCardWidget(
                    thumNail: Image.network(
                        "https://img.freepik.com/free-photo/interior-shot-cafe-with-chairs-near-bar-with-wooden-tables_181624-1669.jpg?semt=ais_incoming&w=740&q=80"),
                    title: "도심 속 조용한 로스터리 카페",
                    content: "머큐리에스프레소바",
                    badgeText: "용산구",
                    tags: ["#커피향 가득", "#스웨덴 커피"],
                    tagCount: "+5",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
