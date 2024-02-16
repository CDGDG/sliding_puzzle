import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';
import 'package:sliding_puzzle/puzzle/widgets/line_puzzle_tile.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) => Card(
        margin: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.size * state.size,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: state.size),
            itemBuilder: (context, index) => index == state.size * state.size - 1
                ? const SizedBox.shrink()
                : switch (state.type) {
                    PuzzleType.number => NumberPuzzleTile(
                        margin: const EdgeInsets.all(0.5),
                        borderRadius: 0,
                        color: state.color,
                        number: index,
                      ),
                    PuzzleType.color => ColorPuzzleTile(
                        margin: const EdgeInsets.all(0.5),
                        borderRadius: 0,
                        color: state.color.withOpacity((1 / (state.size * state.size)) * (index + 1)),
                      ),
                    PuzzleType.line => LinePuzzleTile(
                        margin: const EdgeInsets.all(0.5),
                        borderRadius: 0,
                        color: state.color,
                        index: index,
                      ),
                  },
          ),
        ),
      ),
    );
  }
}
