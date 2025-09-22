import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/home/presentation/widgets/place_card_widget.dart';

class RecommandPlaceView extends StatelessWidget {
  const RecommandPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(
          "오늘은 이런 공간 어때요?",
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF000000),
          ),
        ),
        Text(
          "오늘은 이런 공간 어때요?",
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF000000),
          ),
        ),
        PlaceCardWidget(
          thumNail: Image.network(
              "https://img.freepik.com/free-photo/interior-shot-cafe-with-chairs-near-bar-with-wooden-tables_181624-1669.jpg?semt=ais_incoming&w=740&q=80"),
          title: "도심 속 조용한 로스터리 카페",
          content: "머큐리에스프레소바",
          badgeText: "용산구",
        ),
      ],
    );
  }
}
