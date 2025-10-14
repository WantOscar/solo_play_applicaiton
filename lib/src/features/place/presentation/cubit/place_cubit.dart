import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/place/data/models/place_model.dart';

class PlaceCubit extends Cubit<PlaceModel> {
  PlaceCubit(super.initialState);

  void toggle() {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }
}
