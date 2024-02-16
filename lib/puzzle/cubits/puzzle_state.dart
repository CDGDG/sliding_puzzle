import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'puzzle_state.freezed.dart';

@freezed
class PuzzleState with _$PuzzleState {
  const factory PuzzleState({
    required List<int> puzzle,
    @Default(0) int blank,
    @Default(4) int size,
    @Default(Play.loading) Play play,
    @Default(PuzzleType.number) PuzzleType type,
    @Default(0) int move,
    @Default(Colors.blue) Color color,
  }) = _PuzzleState;
}

enum Play {
  loading,
  playing,
  finish,
}

enum PuzzleType {
  number,
  color,
  line,
}
