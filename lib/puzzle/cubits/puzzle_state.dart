import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'puzzle_state.freezed.dart';

@freezed
class PuzzleState with _$PuzzleState {
  const factory PuzzleState({
    required List<int> puzzle,
    @Default(0) int blank,
    int? last,
    @Default(Offset.zero) Offset offset,
    @Default(Play.loading) Play play,
    @Default(4) int size,
    @Default(PuzzleType.number) PuzzleType type,
    @Default(0) int move,
    @Default(Colors.blue) Color color,
    CountShapeType? countShape,
  }) = _PuzzleState;
}

enum Play {
  loading,
  playing,
  clear,
}

enum PuzzleType {
  number,
  color,
  line,
  stair,
  size,
  count,
}

enum CountShapeType {
  circle,
  tri,
  rect,
  star,
}
