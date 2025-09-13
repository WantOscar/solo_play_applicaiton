import 'package:bloc_test/bloc_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/blocs/bloc.dart';

class MockRegisterPasswordBloc
    extends MockBloc<RegisterPasswordEvent, RegisterPasswordState>
    implements RegisterPasswordBloc {}
