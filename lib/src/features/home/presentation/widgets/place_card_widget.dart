import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:solo_play_application/src/core/widgets/primary_badge_widget.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/primary_tag_widget.dart';

class PlaceCardWidget extends StatelessWidget {
  final Widget thumNail;
  final String title;
  final String content;
  final String badgeText;
  final List<String>? tags;
  final String? tagCount;

  const PlaceCardWidget({
    super.key,
    required this.thumNail,
    required this.title,
    required this.content,
    required this.badgeText,
    this.tags,
    this.tagCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// card의 이미지 영역
        Container(
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
            child: thumNail,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// card의 title 영역
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8),

              /// card의 content 영역
              Text(
                content,
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),

              /// card의 label text + 태그
              SizedBox(
                height: 28,
                child: Row(
                  children: [
                    /// 태그 리스트 + 그라데이션
                    Expanded(
                      child: Stack(
                        children: [
                          /// 태그 리스트
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              PrimaryBadgeWidget(
                                text: badgeText,
                                horizontal: 8,
                                vertical: 3,
                              ),
                              SizedBox(width: 4),
                              ...(tags ?? []).map(
                                (t) => Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: PrimaryTagWidget(text: t),
                                ),
                              ),
                            ],
                          ),

                          /// 오른쪽 페이드 오버레이
                          Align(
                            alignment: Alignment.centerRight,
                            child: IgnorePointer(
                              key: const Key('gradient_overlay'), // ← Key 추가
                              ignoring: true,
                              child: Container(
                                width: 30,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Colors.transparent,
                                      Colors.white.withValues(alpha: 0.9),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// tagCount (+5 같은 표시)
                    if (tagCount != null && tagCount!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          tagCount!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF8E8E8E),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
