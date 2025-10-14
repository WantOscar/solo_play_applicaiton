import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/place/data/models/place_model.dart';
import 'package:solo_play_application/src/features/place/presentation/widgets/best_place_card_widget.dart';
import 'package:solo_play_application/src/features/place/presentation/cubit/place_cubit.dart';

class BestPlaceCardWidgetPage extends StatelessWidget {
  final PlaceModel place;
  final int rank;
  final bool showHeader;
  final void Function()? onBookmarkButtonTap;
  const BestPlaceCardWidgetPage(
      {super.key,
      required this.place,
      required this.rank,
      required this.showHeader,
      this.onBookmarkButtonTap});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlaceCubit(place),
      child: BestPlaceCardWidget(
        rank: rank,
        place: place,
        showHeader: showHeader,
        onBookmarkButtonTap: onBookmarkButtonTap,
      ),
    );
  }
}
