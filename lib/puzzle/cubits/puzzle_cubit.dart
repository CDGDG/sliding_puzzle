import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class PuzzleCubit extends Cubit<PuzzleState> {
  PuzzleCubit() : super(PuzzleState(puzzle: List.generate(4 * 4, (index) => index)));

  void update(int index) {
    int value = state.puzzle[index];
    List<int> newPuzzle = List.from(state.puzzle);
    newPuzzle[index] = 0;
    newPuzzle[state.blank] = value;
    emit(state.copyWith(puzzle: newPuzzle, blank: index, move: state.move + 1));

    for (int i = 1; i < newPuzzle.length; i++) {
      if (newPuzzle[i - 1] != i) return;
    }
    emit(state.copyWith(play: Play.clear));
  }

  void shuffle() {
    emit(state.copyWith(play: Play.loading));

    Random rand = Random();

    int size = rand.nextInt(4) + 3;
    List<int> newPuzzle = List.generate(size * size, (index) => index);
    while (true) {
      newPuzzle.shuffle();
      int inversion = _getInversion(newPuzzle);
      int x = newPuzzle.indexOf(0);
      if (size.isOdd) {
        if (inversion.isEven) break;
      } else {
        if ((size - (x ~/ size)).isEven && inversion.isOdd) break;
        if ((size - (x ~/ size)).isOdd && inversion.isEven) break;
      }
    }

    PuzzleType type = PuzzleType.values[rand.nextInt(PuzzleType.values.length)];

    Color? color;
    if (type == PuzzleType.color) {
      color = Color.fromRGBO(rand.nextInt(256), rand.nextInt(256), rand.nextInt(256), 1);
    } else {
      color = Colors.primaries[rand.nextInt(Colors.primaries.length)];
    }

    emit(state.copyWith(
      puzzle: newPuzzle,
      blank: newPuzzle.indexOf(0),
      size: size,
      play: Play.playing,
      type: type,
      color: color,
      move: 0,
    ));
  }

  int _getInversion(List<int> puzzle) {
    int inversion = 0;
    for (var i = 1; i < puzzle.length; i++) {
      inversion += puzzle.sublist(0, puzzle.indexOf(i)).where((element) => element > i).length;
    }
    return inversion;
  }
}
