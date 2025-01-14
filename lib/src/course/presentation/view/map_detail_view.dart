import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/course/domain/models/map_model.dart';
import 'package:solo_play_application/src/course/presentation/cubit/map_detail_view_cubit.dart';
import 'package:solo_play_application/src/course/presentation/widget/hexagon_grid.dart';
import 'package:solo_play_application/src/course/presentation/widget/label_button.dart';

class MapDetailView extends StatefulWidget {
  final MapModel mapModel;
  const MapDetailView({super.key, required this.mapModel});

  @override
  State<MapDetailView> createState() => _MapDetailViewState();
}

class _MapDetailViewState extends State<MapDetailView> {
  late TransformationController _controller;
  final GlobalKey _childKey = GlobalKey();
  final GlobalKey _parentsKey = GlobalKey();
  final double _initialScale = 1.0;

  void _centerContent() {
    // 전체 지도 제약 조건
    final RenderBox renderBox =
        _childKey.currentContext!.findRenderObject() as RenderBox;
    final Size contentSize = renderBox.size;

    final RenderBox viewportBox =
        _parentsKey.currentContext!.findRenderObject() as RenderBox;
    final Size viewportSize = viewportBox.size;

    // 가운데 좌표 계산
    final double dx =
        -(contentSize.width - viewportSize.width) * _initialScale / 2;
    final double dy =
        -(contentSize.height - viewportSize.height) * _initialScale / 2;
    // 이동
    print((dx, dy));
    _controller.value = Matrix4.identity()
      ..translate(dx, dy)
      ..scale(_initialScale);
  }

  @override
  void initState() {
    _controller = TransformationController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _centerContent());
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MapDetailView oldWidget) {
    if (oldWidget.mapModel != widget.mapModel) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _centerContent());
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<MapDetailViewCubit, MapModel>(
            builder: (context, state) {
          return Text(
            "${state.label}권",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          );
        }),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          _header(),
          _map(),
        ],
      ),
    );
  }

  Widget _header() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "솔플레벨 선택하기",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: LabelButton(label: "혼자는 아직 힘들어요 Lv.1"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: LabelButton(label: "혼자는 아직 힘들어요 Lv.1"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: LabelButton(label: "혼자는 아직 힘들어요 Lv.1"),
                ),
              ]),
            )
          ],
        ),
      );

  Widget _map() {
    return Expanded(
      child: GestureDetector(
        onDoubleTapDown: (details) {
          final currOffset = _controller.toScene(details.localPosition);
          final cubit = context.read<MapDetailViewCubit>();
          final nearMap = cubit.nearArea;
          for (var entry in nearMap.entries) {
            for (var local in entry.value) {
              final x = local.x;
              final y = local.y;
              const radius = 71.5;
              const space = 4.0;
              final center = local.center(x, y, radius, 30);
              final path = local.getHexagonPath(
                  radius: radius,
                  space: space,
                  center: center,
                  borderRadius: 10.0);
              if (path.contains(currOffset)) {
                final dest = entry.key;
                cubit.moveTo(dest);
              }
            }
          }
        },
        child: InteractiveViewer(
            key: _parentsKey,
            constrained: false,
            transformationController: _controller,
            minScale: 0.7,
            maxScale: 2.0,
            child: BlocBuilder<MapDetailViewCubit, MapModel>(
                builder: (context, state) {
              final cubit = context.read<MapDetailViewCubit>();
              return HexagonGrid(key: _childKey, space: 4.0, offsets: [
                ...cubit.map,
                for (List<HexagonPosition> near in cubit.nearArea.values)
                  ...near.map((n) => n.copy(color: const Color(0xffdbdbdb)))
              ]);
            })),
      ),
    );
  }
}
