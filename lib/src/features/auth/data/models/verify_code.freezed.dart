// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyCodeRequest {
  String get email;
  String get code;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyCodeRequestCopyWith<VerifyCodeRequest> get copyWith =>
      _$VerifyCodeRequestCopyWithImpl<VerifyCodeRequest>(
          this as VerifyCodeRequest, _$identity);

  /// Serializes this VerifyCodeRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyCodeRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @override
  String toString() {
    return 'VerifyCodeRequest(email: $email, code: $code)';
  }
}

/// @nodoc
abstract mixin class $VerifyCodeRequestCopyWith<$Res> {
  factory $VerifyCodeRequestCopyWith(
          VerifyCodeRequest value, $Res Function(VerifyCodeRequest) _then) =
      _$VerifyCodeRequestCopyWithImpl;
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class _$VerifyCodeRequestCopyWithImpl<$Res>
    implements $VerifyCodeRequestCopyWith<$Res> {
  _$VerifyCodeRequestCopyWithImpl(this._self, this._then);

  final VerifyCodeRequest _self;
  final $Res Function(VerifyCodeRequest) _then;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VerifyCodeRequest implements VerifyCodeRequest {
  const _VerifyCodeRequest({required this.email, required this.code});
  factory _VerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestFromJson(json);

  @override
  final String email;
  @override
  final String code;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerifyCodeRequestCopyWith<_VerifyCodeRequest> get copyWith =>
      __$VerifyCodeRequestCopyWithImpl<_VerifyCodeRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerifyCodeRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifyCodeRequest &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  @override
  String toString() {
    return 'VerifyCodeRequest(email: $email, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$VerifyCodeRequestCopyWith<$Res>
    implements $VerifyCodeRequestCopyWith<$Res> {
  factory _$VerifyCodeRequestCopyWith(
          _VerifyCodeRequest value, $Res Function(_VerifyCodeRequest) _then) =
      __$VerifyCodeRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class __$VerifyCodeRequestCopyWithImpl<$Res>
    implements _$VerifyCodeRequestCopyWith<$Res> {
  __$VerifyCodeRequestCopyWithImpl(this._self, this._then);

  final _VerifyCodeRequest _self;
  final $Res Function(_VerifyCodeRequest) _then;

  /// Create a copy of VerifyCodeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_VerifyCodeRequest(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$VerifyCodeResponse {
  bool get isVerified;
  String get proofToken;

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyCodeResponseCopyWith<VerifyCodeResponse> get copyWith =>
      _$VerifyCodeResponseCopyWithImpl<VerifyCodeResponse>(
          this as VerifyCodeResponse, _$identity);

  /// Serializes this VerifyCodeResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyCodeResponse &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.proofToken, proofToken) ||
                other.proofToken == proofToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isVerified, proofToken);

  @override
  String toString() {
    return 'VerifyCodeResponse(isVerified: $isVerified, proofToken: $proofToken)';
  }
}

/// @nodoc
abstract mixin class $VerifyCodeResponseCopyWith<$Res> {
  factory $VerifyCodeResponseCopyWith(
          VerifyCodeResponse value, $Res Function(VerifyCodeResponse) _then) =
      _$VerifyCodeResponseCopyWithImpl;
  @useResult
  $Res call({bool isVerified, String proofToken});
}

/// @nodoc
class _$VerifyCodeResponseCopyWithImpl<$Res>
    implements $VerifyCodeResponseCopyWith<$Res> {
  _$VerifyCodeResponseCopyWithImpl(this._self, this._then);

  final VerifyCodeResponse _self;
  final $Res Function(VerifyCodeResponse) _then;

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isVerified = null,
    Object? proofToken = null,
  }) {
    return _then(_self.copyWith(
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      proofToken: null == proofToken
          ? _self.proofToken
          : proofToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VerifyCodeResponse implements VerifyCodeResponse {
  const _VerifyCodeResponse(
      {required this.isVerified, required this.proofToken});
  factory _VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);

  @override
  final bool isVerified;
  @override
  final String proofToken;

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerifyCodeResponseCopyWith<_VerifyCodeResponse> get copyWith =>
      __$VerifyCodeResponseCopyWithImpl<_VerifyCodeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerifyCodeResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifyCodeResponse &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.proofToken, proofToken) ||
                other.proofToken == proofToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isVerified, proofToken);

  @override
  String toString() {
    return 'VerifyCodeResponse(isVerified: $isVerified, proofToken: $proofToken)';
  }
}

/// @nodoc
abstract mixin class _$VerifyCodeResponseCopyWith<$Res>
    implements $VerifyCodeResponseCopyWith<$Res> {
  factory _$VerifyCodeResponseCopyWith(
          _VerifyCodeResponse value, $Res Function(_VerifyCodeResponse) _then) =
      __$VerifyCodeResponseCopyWithImpl;
  @override
  @useResult
  $Res call({bool isVerified, String proofToken});
}

/// @nodoc
class __$VerifyCodeResponseCopyWithImpl<$Res>
    implements _$VerifyCodeResponseCopyWith<$Res> {
  __$VerifyCodeResponseCopyWithImpl(this._self, this._then);

  final _VerifyCodeResponse _self;
  final $Res Function(_VerifyCodeResponse) _then;

  /// Create a copy of VerifyCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isVerified = null,
    Object? proofToken = null,
  }) {
    return _then(_VerifyCodeResponse(
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      proofToken: null == proofToken
          ? _self.proofToken
          : proofToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
