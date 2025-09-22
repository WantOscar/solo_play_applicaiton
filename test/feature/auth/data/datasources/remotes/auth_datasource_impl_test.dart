import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/remotes/auth_datasource_impl.dart';
import 'package:solo_play_application/src/features/auth/data/models/verify_code_request.dart';
import 'package:solo_play_application/src/features/auth/data/utils/api_path.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio mockDio;
  late AuthDatasource datasource;

  setUp(() {
    mockDio = MockDio();
    datasource = AuthDatasourceImpl(dio: mockDio);
  });

  group('verifyCode', () {
    const verifyCodeRequest = VerifyCodeRequest(email: 'test@test.com', code: '123456');
    final successResponse = {
      'message': '인증에 성공했습니다.',
    };

    test('should return Success(String) when the call is successful', () async {
      // Arrange
      when(() => mockDio.post(
            AuthApiPath.checkVerifyCode,
            data: verifyCodeRequest.toJson(),
          )).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: AuthApiPath.checkVerifyCode),
          data: successResponse,
          statusCode: 200,
        ),
      );

      // Act
      final result = await datasource.verifyCode(verifyCodeRequest);

      // Assert
      expect(result, isA<Success>());
      expect((result as Success).value, successResponse['message']);
      verify(() => mockDio.post(
            AuthApiPath.checkVerifyCode,
            data: verifyCodeRequest.toJson(),
          )).called(1);
      verifyNoMoreInteractions(mockDio);
    });
  });
}
