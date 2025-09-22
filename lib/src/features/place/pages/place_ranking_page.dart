import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/place/core/place_api_services_provider.dart';
import 'package:solo_play_application/src/features/place/core/place_repository_provider.dart';
import 'package:solo_play_application/src/features/place/domain/repositories/place_repository.dart';
import 'package:solo_play_application/src/features/place/presentation/blocs/place_ranking_bloc.dart';
import 'package:solo_play_application/src/features/place/presentation/blocs/place_ranking_event.dart';
import 'package:solo_play_application/src/features/place/presentation/view/place_ranking_view.dart';

class PlaceRankingPage extends StatelessWidget {
  const PlaceRankingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        placeApiSerivcesProvider,
        placeRepositoryProvider,
        BlocProvider(
            create: (context) => PlaceRankingBloc(
                placeRepository: context.read<PlaceRepository>())
              ..add(FetchData())),
      ],
      child: PlaceRankingView(),
    );
  }
}
