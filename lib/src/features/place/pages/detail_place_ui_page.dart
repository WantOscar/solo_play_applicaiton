import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/place/data/models/place_model.dart';

import 'package:solo_play_application/src/features/place/presentation/cubit/place_cubit.dart';
import 'package:solo_play_application/src/features/place/presentation/view/detail_place_ui.dart';

class DetailPlaceUiPage extends StatelessWidget {
  final int rank;
  final PlaceModel place;
  const DetailPlaceUiPage({super.key, required this.rank, required this.place});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlaceCubit(place),
      child: DetailPlaceUI(
        rank: rank,
        place: place,
      ),
    );
  }
}
