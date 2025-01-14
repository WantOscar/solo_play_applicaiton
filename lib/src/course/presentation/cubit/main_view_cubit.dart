import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewCubit extends Cubit<bool> {
  MainViewCubit() : super(true);

  var events = [];

  void onPointerDown(PointerDownEvent event) {
    events.add(event);
  }

  void onPointerUp(PointerUpEvent event) {
    events.clear();
    emit(true);
  }

  void onPointerMove(PointerMoveEvent event) {
    if (events.length == 2) {
      emit(false);
    }
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    print(change);
  }
}
