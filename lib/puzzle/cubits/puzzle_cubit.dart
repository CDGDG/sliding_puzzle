import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class PuzzleCubit extends Cubit<PuzzleState> {
  PuzzleCubit(this.size) : super(PuzzleState(puzzle: List.generate(size * size, (index) => index))) {
    answer = List.generate(size * size - 1, (index) => index + 1)..add(0);
  }

  final int size;
  late final List<int> answer;

  void update(int index) {
    int value = state.puzzle[index];
    List<int> newPuzzle = List.from(state.puzzle);
    newPuzzle[index] = 0;
    newPuzzle[state.blank] = value;
    emit(state.copyWith(puzzle: newPuzzle, blank: index));

    if (newPuzzle == answer) emit(state.copyWith(play: Play.finish));
  }

  void shuffle() {
    emit(state.copyWith(play: Play.loading));
    List<int> newPuzzle = List.from(state.puzzle);
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

    emit(state.copyWith(puzzle: newPuzzle, blank: newPuzzle.indexOf(0), play: Play.playing));
  }

  int _getInversion(List<int> puzzle) {
    int inversion = 0;
    for (var i = 1; i < puzzle.length; i++) {
      inversion += puzzle.sublist(0, puzzle.indexOf(i)).where((element) => element > i).length;
    }
    return inversion;
  }
}
