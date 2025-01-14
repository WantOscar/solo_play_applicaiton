import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/course/domain/models/map_model.dart';
import 'package:solo_play_application/src/course/presentation/cubit/map_detail_view_cubit.dart';
import 'package:solo_play_application/src/course/presentation/view/map_detail_view.dart';
import 'package:solo_play_application/src/course/presentation/view/map_view.dart';

class MapDetailPage extends StatelessWidget {
  final MapModel mapModel;
  const MapDetailPage({super.key, required this.mapModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapDetailViewCubit>(
      create: (context) => MapDetailViewCubit(mapModel),
    );
  }
}
