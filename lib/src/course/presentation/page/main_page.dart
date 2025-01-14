import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/course/presentation/bloc/main_view_cubit.dart';
import 'package:solo_play_application/src/course/presentation/view/main_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainViewCubit(),
      child: const MainView(),
    );
  }
}
