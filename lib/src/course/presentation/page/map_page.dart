import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/course/domain/models/map_model.dart';
import 'package:solo_play_application/src/course/presentation/cubit/map_view_cubit.dart';
import 'package:solo_play_application/src/course/presentation/view/map_view.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapViewCubit(MapModel.gangbuk),
      child: const MapView(),
    );
  }
}
