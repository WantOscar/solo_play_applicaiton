import 'package:bloc_test/bloc_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';

class MockVerificationBloc
    extends MockBloc<VerificationEvent, VerificationState>
    implements VerificationBloc {}
