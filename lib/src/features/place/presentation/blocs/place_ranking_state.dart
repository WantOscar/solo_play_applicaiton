import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/features/place/data/models/place_model.dart';

part 'place_ranking_state.freezed.dart';

@freezed
sealed class PlaceRankingState with _$PlaceRankingState {
  const factory PlaceRankingState.loading() = Loading;

  const factory PlaceRankingState.loaded({
    required List<PlaceModel> places,
  }) = Loaded;

  const factory PlaceRankingState.error({required String error}) = Error;
}
