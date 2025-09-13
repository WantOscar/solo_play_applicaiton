import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/core/utils/validators/email_validator.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/check_email_duplicate_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/user_email_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/user_email_state.dart';

/// 사용자 이메일 관련 [UserEmailBloc]
///
/// 이 클래스는 사용자의 이메일 변경 또는 입력에 관한 모든 비즈니스 로직을 담당합니다.
class UserEmailBloc extends Bloc<UserEmailEvent, UserEmailState> {
  /// [CheckEmailDuplicateUsecase]로 사용자 이메일이 중복되었는지 검증할 수 있습니다.
  final CheckEmailDuplicateUsecase _checkEmailDuplicateUsecase;

  UserEmailBloc({
    required CheckEmailDuplicateUsecase checkEmailDuplicateUsecase,
  })  : _checkEmailDuplicateUsecase = checkEmailDuplicateUsecase,
        super(UserEmailState()) {
    on<UserEmailChanged>(_onChaned);
    on<UserEmailCheckDuplicate>(_onCheckDuplicate);
  }

  /// 사용자가 이메일을 변경하게 되면
  /// 이메일이 올바른 형식인지 검증하여 상태를 갱신합니다.
  FutureOr<void> _onChaned(
      UserEmailChanged event, Emitter<UserEmailState> emit) {
    final email = event.email;
    if (email.isEmpty) {
      emit(state.copyWith(
          email: email, status: UserEmailStatus.empty, errorMessage: ""));
    }
    final isValid = EmailValidator.isValid(email);
    emit(state.copyWith(
        email: email,
        status: isValid ? UserEmailStatus.valid : UserEmailStatus.invalid,
        errorMessage: ""));
  }

  /// 사용자가 이메일 중복 검증을 요청하면 [CheckEmailDuplicateUsecase]를 통해서 검증합니다.
  /// 이후 반환값으로 사용가능한지 [isAvail]을 갱신합니다.
  FutureOr<void> _onCheckDuplicate(
      UserEmailCheckDuplicate event, Emitter<UserEmailState> emit) async {
    final result = await _checkEmailDuplicateUsecase.call(event.email);
    emit(switch (result) {
      Success() => state.copyWith(status: UserEmailStatus.avail),
      Failure(:final message) =>
        state.copyWith(errorMessage: message, status: UserEmailStatus.conflict),
    });
  }
}
