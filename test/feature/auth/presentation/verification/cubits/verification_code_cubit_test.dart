import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/cubits/verification_code_cubit.dart';

void main() {
  group('VerificationCodeCubit', () {
    late VerificationCodeCubit verificationCodeCubit;

    setUp(() {
      verificationCodeCubit = VerificationCodeCubit();
    });

    tearDown(() {
      verificationCodeCubit.close();
    });

    test('initial state is empty string', () {
      expect(verificationCodeCubit.state, '');
    });

    blocTest<VerificationCodeCubit, String>(
      'emits [newCode] when updateCode is called',
      build: () => verificationCodeCubit,
      act: (cubit) => cubit.updateCode('123456'),
      expect: () => ['123456'],
    );

    blocTest<VerificationCodeCubit, String>(
      'emits [partialCode] when updateCode is called with partial input',
      build: () => verificationCodeCubit,
      act: (cubit) => cubit.updateCode('123'),
      expect: () => ['123'],
    );
  });
}