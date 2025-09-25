import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/views/verification_intro_ui.dart';

import '../mocks/mock_register_bloc.dart';
import '../mocks/mock_verification_bloc.dart';

void main() {
  group(VerificationIntroUI, () {
    late MockRegisterBloc mockRegisterBloc;
    late MockVerificationBloc mockVerificationBloc;

    late Widget widget;

    setUp(() {
      mockRegisterBloc = MockRegisterBloc();
      mockVerificationBloc = MockVerificationBloc();

      widget = MaterialApp(
          home: MultiBlocProvider(
        providers: [
          BlocProvider<RegisterBloc>.value(value: mockRegisterBloc),
          BlocProvider<VerificationBloc>.value(value: mockVerificationBloc),
        ],
        child: VerificationIntroUI(),
      ));

      when(() => mockRegisterBloc.state).thenReturn(RegisterState());
      when(() => mockVerificationBloc.state).thenReturn(VerificationState());
    });

    testWidgets('should render correctly', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byType(VerificationIntroUI),
          matchesGoldenFile("goldens/verification-intro-ui-default.png"));
    });
  });
}
