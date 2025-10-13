import 'package:bloc_test/bloc_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_state.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}
