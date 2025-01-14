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
          const HexagonPosition(x: 2, y: 0),
          const HexagonPosition(x: 1, y: 1),
          const HexagonPosition(x: 2, y: 1),
          const HexagonPosition(x: 3, y: 1),
        ];
      case MapModel.dosim:
        return [
          const HexagonPosition(x: 1, y: 1),
          const HexagonPosition(x: 2, y: 1),
          const HexagonPosition(x: 0, y: 2),
          const HexagonPosition(x: 1, y: 2),
          const HexagonPosition(x: 2, y: 2),
          const HexagonPosition(x: 1, y: 3),
        ];
      case MapModel.dongseoul:
        return [
          const HexagonPosition(x: 1, y: 1),
          const HexagonPosition(x: 2, y: 1),
          const HexagonPosition(x: 1, y: 2),
          const HexagonPosition(x: 2, y: 2),
        ];
      case MapModel.seonam:
        return [
          const HexagonPosition(x: 0, y: 0, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 1, y: 1, type: HexagonSectionType.bottom),
        ];
      case MapModel.namseoul:
        return [
          const HexagonPosition(x: 0, y: 1, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 1, y: 1, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 2, y: 1, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 0, y: 2, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 1, y: 2, type: HexagonSectionType.bottom),
        ];

      case MapModel.gangnam:
        return [
          const HexagonPosition(x: 2, y: 1, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 1, y: 2, type: HexagonSectionType.bottom),
        ];
      case MapModel.dongnam:
        return [
          const HexagonPosition(x: 2, y: 0, type: HexagonSectionType.bottom),
          const HexagonPosition(x: 1, y: 1, type: HexagonSectionType.bottom),
        ];
    }
  }

  Map<MapModel, List<HexagonPosition>> get nearArea {
    switch (state) {
      case MapModel.gangbuk:
        return {
          MapModel.dosim: [
            const HexagonPosition(x: 0, y: 1),
            const HexagonPosition(x: 1, y: 2),
          ],
          MapModel.dongseoul: [
            const HexagonPosition(x: 4, y: 1),
            const HexagonPosition(x: 3, y: 2),
          ],
        };
      case MapModel.dosim:
        return {
          MapModel.gangbuk: [
            const HexagonPosition(x: 2, y: 0),
          ],
          MapModel.dongseoul: [
            const HexagonPosition(x: 3, y: 1),
            const HexagonPosition(x: 3, y: 2),
          ],
          MapModel.namseoul: [
            const HexagonPosition(x: 0, y: 3, type: HexagonSectionType.bottom),
            const HexagonPosition(x: 1, y: 4, type: HexagonSectionType.bottom),
          ],
          MapModel.gangnam: [
            const HexagonPosition(x: 2, y: 3, type: HexagonSectionType.bottom)
          ],
        };
      case MapModel.dongseoul:
        return {
          MapModel.gangbuk: [
            const HexagonPosition(x: 0, y: 0),
            const HexagonPosition(x: 1, y: 0),
          ],
          MapModel.dosim: [
            const HexagonPosition(x: 0, y: 1),
            const HexagonPosition(x: 0, y: 2),
          ],
          MapModel.gangnam: [
            const HexagonPosition(x: 1, y: 3, type: HexagonSectionType.bottom),
          ],
          MapModel.dongnam: [
            const HexagonPosition(x: 2, y: 3, type: HexagonSectionType.bottom),
            const HexagonPosition(x: 3, y: 3, type: HexagonSectionType.bottom),
          ],
        };
      case MapModel.seonam:
        return {
          MapModel.dosim: [
            const HexagonPosition(x: 2, y: 0),
          ],
          MapModel.namseoul: [
            const HexagonPosition(x: 2, y: 1, type: HexagonSectionType.bottom),
            const HexagonPosition(x: 1, y: 2, type: HexagonSectionType.bottom),
          ],
        };
      case MapModel.namseoul:
        return {
          MapModel.seonam: [
            const HexagonPosition(x: 0, y: 0, type: HexagonSectionType.bottom),
          ],
          MapModel.dosim: [
            const HexagonPosition(x: 1, y: 0),
            const HexagonPosition(x: 2, y: 0),
          ],
          MapModel.gangnam: [
            const HexagonPosition(x: 3, y: 1, type: HexagonSectionType.bottom),
          ],
        };
      case MapModel.gangnam:
        return {
          MapModel.namseoul: [
            const HexagonPosition(x: 0, y: 2, type: HexagonSectionType.bottom)
          ],
          MapModel.dosim: [
            const HexagonPosition(x: 0, y: 1),
            const HexagonPosition(x: 1, y: 1),
          ],
          MapModel.dongseoul: [
            const HexagonPosition(x: 2, y: 0),
            const HexagonPosition(x: 3, y: 1),
          ],
          MapModel.dongnam: [
            const HexagonPosition(x: 3, y: 2, type: HexagonSectionType.bottom),
          ],
        };
      case MapModel.dongnam:
        return {
          MapModel.gangnam: [
            const HexagonPosition(x: 0, y: 0, type: HexagonSectionType.bottom)
          ],
          MapModel.dongseoul: [
            const HexagonPosition(x: 1, y: 0),
          ],
        };
    }
  }
}
