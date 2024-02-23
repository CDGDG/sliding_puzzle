import 'package:freezed_annotation/freezed_annotation.dart';

part 'points_state.freezed.dart';

@freezed
class PointsState with _$PointsState {
  const factory PointsState.init() = _Init;
  const factory PointsState.loading() = _Loading;
  const factory PointsState.loaded(int points) = _Loaded;
  const factory PointsState.error(String message) = _Error;
  const factory PointsState.unauthorized() = _Unauthorized;
}