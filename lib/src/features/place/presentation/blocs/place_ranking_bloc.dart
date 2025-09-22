import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/place/data/models/place_model.dart';
import 'package:solo_play_application/src/features/place/domain/repositories/place_repository.dart';
import 'package:solo_play_application/src/features/place/presentation/blocs/place_ranking_event.dart';
import 'package:solo_play_application/src/features/place/presentation/blocs/place_ranking_state.dart';

class PlaceRankingBloc extends Bloc<PlaceRankingEvent, PlaceRankingState> {
  final PlaceRepository placeRepository;
  PlaceRankingBloc({
    required this.placeRepository,
  }) : super(Loading()) {
    on<FetchData>(_fetchData);
    on<UserBookmarkToggle>(_userBookmarkToggleHandler);
  }

  void _fetchData(FetchData event, Emitter<PlaceRankingState> emit) async {
    try {
      final response = await placeRepository.fetchData();
      emit(Loaded(
          places: response
              .map((entity) => PlaceModel.fromEntity(entity))
              .toList()));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  FutureOr<void> _userBookmarkToggleHandler(
      UserBookmarkToggle event, Emitter<PlaceRankingState> emit) {
    log("user bookmark toggle");
    // 서버 통신 후

    // 성공하면 데이터 교체
    // 교체할 장소
    final target = event.place;
    // 로딩 상태인 경우에만 교체 가능
    final prevState = (state as Loaded);
    // 이전 장소들
    final prevPlaces = prevState.places;
    // 갱신 후 업데이트
    emit(prevState.copyWith(
        places: prevPlaces.map((place) {
      // 장소 중 target과 같은것만 업데이트
      if (place == target) {
        return target.copyWith(isFavorite: !target.isFavorite);
      } else {
        // 다른 장소는 그대로 갱신
        return place;
      }
    }).toList()));
  }

  @override
  void onChange(Change<PlaceRankingState> change) {
    log("prev state : ${change.currentState} next state : ${change.nextState}");
    super.onChange(change);
  }
}
