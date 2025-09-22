import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/features/place/data/models/place_model.dart';

part 'place_ranking_event.freezed.dart';

@freezed
sealed class PlaceRankingEvent with _$PlaceRankingEvent {
  const factory PlaceRankingEvent.fetchData() = FetchData;
  const factory PlaceRankingEvent.userBookmarkToggle({
    required PlaceModel place,
  }) = UserBookmarkToggle;
  const factory PlaceRankingEvent() = _PlaceRankingEvent;
}
