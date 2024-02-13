import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) {
        final size = context.read<PuzzleCubit>().size;
        return Card(
          margin: EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: size * size,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
              itemBuilder: (context, index) => index == 15
                  ? const SizedBox.shrink()
                  : state.type == PuzzleType.color
                      ? ColorPuzzleTile(
                          margin: const EdgeInsets.all(0.3),
                          borderRadius: 0,
                          color: state.color?.withOpacity((1 / (size * size)) * (index + 1)),
                        )
                      : NumberPuzzleTile(
                          margin: const EdgeInsets.all(0.3),
                          borderRadius: 0,
                          number: index,
                        ),
            ),
          ),
        );
      },
    );
  }
}
