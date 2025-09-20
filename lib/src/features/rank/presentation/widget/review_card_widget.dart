import 'package:flutter/material.dart';
import 'package:solo_play_application/src/core/widgets/profile_image_widget.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/primary_tag_widget.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 262,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          /// 사진 영역
          Container(
            height: 131,
            width: 227,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                'https://cdn.bhdw.net/im/cafe-of-the-woods-wallpaper-41165_w635.webp',
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// 사진에 대한 정보 영역
          SizedBox(
            height: 131,
            width: 227,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      ProfileImageWidget(
                        width: 24,
                        height: 24,
                        path:
                            'https://cdn.kids.donga.com/news/photo/202411/164154_257487_5034.jpg',
                      ),
                      SizedBox(width: 2),
                      Text(
                        '동네백수',
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff0F0F0F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '햇살이 잘 들어오는 창가 자리에서 커피 한 잔 하니까 마음까지 따뜻해졌어요. 인테리어도 아늑하고 조용해서 혼자 시간 보내기 딱 좋았어요. 라떼랑 당근 케이크 조합도 최고였어요!',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff0F0F0F),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: List.generate(
                      2,
                      (index) {
                        return const Padding(
                          padding: EdgeInsets.only(right: 4.0),
                          child: PrimaryTagWidget(text: '#커피향 가득'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
