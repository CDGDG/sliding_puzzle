import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

@freezed
class SigninState with _$SigninState {
  const factory SigninState.init() = _Init;
  const factory SigninState.loading() = _Loading;
  const factory SigninState.signin() = _Signin;
  const factory SigninState.fail() = _Fail;
  const factory SigninState.error(String message) = _Error;
}