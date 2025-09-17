import 'package:flutter/cupertino.dart';
import 'package:solo_play_application/src/core/widgets/primary_badge_widget.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/primary_tag_widget.dart';

class PlaceCardWidget extends StatelessWidget {
  final Widget thumNail;
  final String title;
  final String content;
  final String badgeText;
  final List<String>? tags;

  const PlaceCardWidget({
    super.key,
    required this.thumNail,
    required this.title,
    required this.content,
    required this.badgeText,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// card의 이미지 영역
        Container(
          // key: Key('place_thumbnail_container'),
          height: 131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: thumNail),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              /// card의 title 영역
              Text(
                // '도심 속 조용한 로스터리 카페',
                title,
                style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 8),

              /// card의 content 영역
              Text(
                // '머큐리에스프레소바',
                content,
                style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8),

              /// card의 label text 영역(위치 구, # 태그)
              Row(
                children: [
                  PrimaryBadgeWidget(
                    // text: "용산구",
                    text: badgeText,
                    horizontal: 8,
                    vertical: 3,
                  ),
                  SizedBox(width: 4),
                  ...(tags ?? []).map(
                    (t) => Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: PrimaryTagWidget(
                        text: t,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
