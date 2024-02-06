import 'package:freezed_annotation/freezed_annotation.dart';

part 'puzzle_state.freezed.dart';

@freezed
class PuzzleState with _$PuzzleState {
  const factory PuzzleState({
    required List<int> puzzle,
    @Default(0) int blank,
    @Default(Play.loading) Play play,
  }) = _PuzzleState;
}

enum Play {
  loading,
  playing,
  finish,
}
