import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/app/presentation/cubits/bottom_nav_cubit.dart';
import 'package:solo_play_application/src/features/app/presentation/view/app_ui.dart';

class AppPage extends StatelessWidget {
  final Widget child;
  const AppPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => BottomNavCubit())],
      child: AppUI(
        child: child,
      ),
    );
  }
}
