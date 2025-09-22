import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:solo_play_application/src/features/place/presentation/blocs/place_ranking_state.dart';
import 'package:solo_play_application/src/features/place/presentation/widgets/best_place_card_widget.dart';
import 'package:solo_play_application/src/features/place/presentation/blocs/place_ranking_bloc.dart';
import 'package:solo_play_application/src/features/place/presentation/blocs/place_ranking_event.dart';
import 'package:solo_play_application/src/features/place/presentation/widgets/show_tip_place_widget.dart';

class PlaceRankingView extends HookWidget {
  const PlaceRankingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = usePageController();
    final state = context.watch<PlaceRankingBloc>().state;

    switch (state) {
      case Loading():
        return Container();
      case Loaded(places: final places):
        final bloc = context.read<PlaceRankingBloc>();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// 장소에서 tip을 보여주는 고정 위젯
            const ShowTipPlaceWidget(),

            /// place에서의 핫플 place card widget을 보여줌.
            /// 순위 갯수만큼 보여줌(최대 10개).
            Expanded(
              child: PageView.builder(
                padEnds: false,
                controller: controller,
                itemCount: places.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final place = places[index];

                  return Align(
                    alignment: Alignment.topCenter,
                    child: BestPlaceCardWidget(
                      place: place,
                      rank: index + 1,
                      showHeader: true,
                      onBookmarkButtonTap: () {
                        bloc.add(UserBookmarkToggle(place: place));
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );

      case Error():
        return Container();
    }
  }
}
