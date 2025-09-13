import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCodeCubit extends Cubit<String> {
  VerificationCodeCubit() : super('');

  void updateCode(String code) {
    emit(code);
  }
}