import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/course/domain/models/map_model.dart';
import 'package:solo_play_application/src/course/presentation/cubit/map_view_cubit.dart';
import 'package:solo_play_application/src/course/presentation/widget/hexagon_grid.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final TransformationController _controller;
  final GlobalKey _contentKey = GlobalKey();
  final GlobalKey _viewportKey = GlobalKey();
  final double _initialScale = 1.0;

  @override
  void initState() {
    _controller = TransformationController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _centerContent());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 초기 위치를 지정하는 함수
  /// 전체 지도에서 가장 가운데 좌표로 시점을 이동함.
  void _centerContent() {
    // 전체 지도 제약 조건
    final RenderBox renderBox =
        _contentKey.currentContext!.findRenderObject() as RenderBox;
    final Size contentSize = renderBox.size;

    final RenderBox viewportBox =
        _viewportKey.currentContext!.findRenderObject() as RenderBox;
    final Size viewportSize = viewportBox.size;

    // 가운데 좌표 계산
    final double dx =
        -(contentSize.width - viewportSize.width) * _initialScale / 2;
    final double dy =
        -(contentSize.height - viewportSize.height) * _initialScale / 2;
    // 이동
    _controller.value = Matrix4.identity()
      ..translate(dx, dy)
      ..scale(_initialScale);
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      key: _viewportKey,
      transformationController: _controller,
      constrained: false,
      minScale: 0.1,
      maxScale: 1.7,
      child: FittedBox(
        child: BlocBuilder<MapViewCubit, MapModel>(builder: (context, state) {
          return HexagonGrid(
            key: _contentKey,
            space: 4.0,
            offsets: [
              ...state
                  .getMap(MapModel.dosim)
                  .map((it) => it.copy(color: const Color(0xffE3EFED))),
              ...state
                  .getMap(MapModel.gangbuk)
                  .map((it) => it.copy(color: const Color(0xffD4D7EA))),
              ...state
                  .getMap(MapModel.dongseoul)
                  .map((it) => it.copy(color: const Color(0xff91C4EF))),
              ...state
                  .getMap(MapModel.seonam)
                  .map((it) => it.copy(color: const Color(0xffECDFBB))),
              ...state
                  .getMap(MapModel.namseoul)
                  .map((it) => it.copy(color: const Color(0xffD9E4A9))),
              ...state
                  .getMap(MapModel.gangnam)
                  .map((it) => it.copy(color: const Color(0xffF592A4))),
              ...state
                  .getMap(MapModel.dongnam)
                  .map((it) => it.copy(color: const Color(0xffDAA0DD))),
            ],
          );
        }),
      ),
    );
  }
}
