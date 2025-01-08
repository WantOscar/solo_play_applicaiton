import 'package:flutter/material.dart';
import 'package:solo_play_application/src/main/widgets/hexagon_grid.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _overRiver(),
        _underRiver(),
      ],
    );
  }

  Widget _overRiver() => HexagonGrid(
        space: 4.0,
        offsets: [
          HexagonPosition(
            x: 2,
            y: 0,
            color: const Color(0xffd9d9d9).withOpacity(0.3),
          ),
          HexagonPosition(
            x: 0,
            y: 1,
            color: const Color(0xffd9d9d9).withOpacity(0.3),
          ),
          const HexagonPosition(x: 1, y: 1, color: Color(0xffd9d9d9)),
          const HexagonPosition(x: 2, y: 1, color: Color(0xffd9d9d9)),
          HexagonPosition(
            x: 3,
            y: 1,
            color: const Color(0xffd9d9d9).withOpacity(0.3),
          ),
          const HexagonPosition(x: 1, y: 2, color: Color(0xffd9d9d9)),
        ],
      );

  Widget _underRiver() => Positioned(
        top: 270,
        bottom: 1.0,
        child: HexagonGrid(
          space: 4.0,
          offsets: [
            const HexagonPosition(x: 0, y: 0, color: Color(0xffd9d9d9)),
            const HexagonPosition(x: 2, y: 0, color: Color(0xffd9d9d9)),
            const HexagonPosition(x: 3, y: 0, color: Color(0xffd9d9d9)),
            HexagonPosition(
                x: 0, y: 1, color: const Color(0xffd9d9d9).withOpacity(0.3)),
            const HexagonPosition(x: 1, y: 1, color: Color(0xffd9d9d9)),
            HexagonPosition(
                x: 2, y: 1, color: const Color(0xffd9d9d9).withOpacity(0.3)),
          ],
        ),
      );
}
