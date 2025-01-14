import 'dart:ui';

import 'package:solo_play_application/src/course/presentation/widget/hexagon_grid.dart';

enum MapModel {
  gangbuk("강북"),
  dosim("도심"),
  dongseoul("동서울"),
  seonam("서남"),
  namseoul("남서울"),
  gangnam("강남"),
  dongnam("동남");

  final String label;
  const MapModel(
    this.label,
  );

  List<HexagonPosition> getMap(MapModel type) {
    switch (type) {
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

  List<Path> getPaths(
    MapModel type, {
    required double radius,
    required double borderRadius,
    required double distance,
    required double space,
  }) {
    final positions = getMap(type);
    return positions.map((pos) {
      final x = pos.x;
      final y = pos.y;
      final center = pos.center(x, y, radius, distance);
      final path = pos.getHexagonPath(
          radius: radius,
          space: space,
          center: center,
          borderRadius: borderRadius);
      return path;
    }).toList();
  }
}
