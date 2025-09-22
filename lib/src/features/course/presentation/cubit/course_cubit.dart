import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/course/data/models/course_model.dart';

class CourseCubit extends Cubit<CourseModel> {
  CourseCubit(super.initialState);

  void toggle() {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }
}
