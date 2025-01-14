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
  late String label;
  late ScrollController _vertController;
  late ScrollController _horizController;

  @override
  void initState() {
    label = widget.mapModel.label;
    _vertController = ScrollController();
    _horizController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final horizMid = _horizController.position.maxScrollExtent / 2;
      final vertMid = _vertController.position.maxScrollExtent / 2;
      _horizController.jumpTo(horizMid);
      _vertController.jumpTo(vertMid);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$label권",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
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
    final mapDetailViewCubit = MapDetailViewCubit(widget.mapModel);
    return SingleChildScrollView(
      controller: _vertController,
      child: SingleChildScrollView(
        controller: _horizController,
        scrollDirection: Axis.horizontal,
        child: InteractiveViewer(
            minScale: 0.7,
            maxScale: 4.0,
            child: BlocBuilder<MapDetailViewCubit, MapModel>(
                bloc: mapDetailViewCubit,
                builder: (context, state) {
                  return HexagonGrid(space: 4.0, offsets: context.read());
                })),
      ),
    );
  }
}
