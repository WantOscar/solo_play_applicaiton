import 'package:flutter/material.dart';
import 'package:solo_play_application/src/main/widgets/hexagon_grid.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HexagonPosition> gangbuk = [
      const HexagonPosition(x: 4, y: 0),
      const HexagonPosition(x: 5, y: 0),
      const HexagonPosition(x: 6, y: 0),
      const HexagonPosition(x: 5, y: 1),
    ];

    final List<HexagonPosition> dosim = [
      const HexagonPosition(x: 3, y: 3),
      const HexagonPosition(x: 4, y: 1),
      const HexagonPosition(x: 4, y: 2),
      const HexagonPosition(x: 4, y: 3),
      const HexagonPosition(x: 5, y: 2),
      const HexagonPosition(x: 5, y: 3),
    ];
    final List<HexagonPosition> dongseoul = [
      const HexagonPosition(x: 6, y: 1),
      const HexagonPosition(x: 6, y: 2),
      const HexagonPosition(x: 7, y: 2),
      const HexagonPosition(x: 7, y: 3),
    ];
    final List<HexagonPosition> seonam = [
      const HexagonPosition(x: 1, y: 3, type: HexagonSectionType.bottom),
      const HexagonPosition(x: 2, y: 3, type: HexagonSectionType.bottom),
    ];
    final List<HexagonPosition> namseoul = [
      const HexagonPosition(x: 2, y: 4, type: HexagonSectionType.bottom),
      const HexagonPosition(x: 2, y: 5, type: HexagonSectionType.bottom),
      const HexagonPosition(x: 3, y: 4, type: HexagonSectionType.bottom),
      const HexagonPosition(x: 3, y: 5, type: HexagonSectionType.bottom),
      const HexagonPosition(x: 4, y: 4, type: HexagonSectionType.bottom),
    ];
    final List<HexagonPosition> gangnam = [
      const HexagonPosition(x: 5, y: 4, type: HexagonSectionType.bottom),
      const HexagonPosition(x: 6, y: 3, type: HexagonSectionType.bottom),
    ];
    final List<HexagonPosition> dongnam = [
      const HexagonPosition(x: 7, y: 4, type: HexagonSectionType.bottom),
      const HexagonPosition(x: 8, y: 3, type: HexagonSectionType.bottom),
    ];

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(20.0),
          minScale: 0.1,
          maxScale: 4.0,
          child: HexagonGrid(
            space: 4.0,
            offsets: [
              ...dosim,
              ...gangbuk,
              ...dongseoul,
              ...seonam,
              ...namseoul,
              ...gangnam,
              ...dongnam,
            ],
          ),
        ),
      ),
    );
  }
}
