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
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: size * size,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
            itemBuilder: (context, index) => index == 15
                ? const SizedBox.shrink()
                : state.type == PuzzleType.color
                    ? ColorPuzzleTile(
                        color: state.color?.withOpacity((1 / (size * size)) * (index + 1)),
                      )
                    : NumberPuzzleTile(
                        number: index,
                      ),
          ),
        );
      },
    );
  }
}
