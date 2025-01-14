import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/course/domain/models/map_model.dart';
import 'package:solo_play_application/src/course/presentation/widget/hexagon_grid.dart';

class MapDetailViewCubit extends Cubit<MapModel> {
  MapDetailViewCubit(super.initialState);

  void moveTo(MapModel model) => emit(model);

  List<HexagonPosition> get map {
    switch (state) {
      case MapModel.gangbuk:
        return [
          const HexagonPosition(x: 4, y: 0),
          const HexagonPosition(x: 5, y: 0),
          const HexagonPosition(x: 6, y: 0),
          const HexagonPosition(x: 5, y: 1),
        ];
      case MapModel.dosim:
        return [
          const HexagonPosition(x: 3, y: 3),
          const HexagonPosition(x: 4, y: 1),
          const HexagonPosition(x: 4, y: 2),
          const HexagonPosition(x: 4, y: 3),
          const HexagonPosition(x: 5, y: 2),
          const HexagonPosition(x: 5, y: 3),
        ];
      case MapModel.dongseoul:
        return [
          const HexagonPosition(x: 6, y: 1),
          const HexagonPosition(x: 6, y: 2),
          const HexagonPosition(x: 7, y: 2),
          const HexagonPosition(x: 7, y: 3),
        ];
      case MapModel.seonam:
        return [
          const HexagonPosition(x: 1, y: 3, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 2, y: 3, type: HexagonSectionType.bottom),
        ];
      case MapModel.namseoul:
        return [
          const HexagonPosition(x: 2, y: 4, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 2, y: 5, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 3, y: 4, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 3, y: 5, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 4, y: 4, type: HexagonSectionType.bottom),
        ];

      case MapModel.gangnam:
        return [
          const HexagonPosition(x: 5, y: 4, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 6, y: 3, type: HexagonSectionType.bottom),
        ];
      case MapModel.dongnam:
        return [
          const HexagonPosition(x: 7, y: 4, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 8, y: 3, type: HexagonSectionType.bottom),
        ];
    }
  }
}
