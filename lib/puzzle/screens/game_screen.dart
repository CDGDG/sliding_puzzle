import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) => Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                "SLIDING PUZZLE",
                style: TextStyle(
                  fontSize: 30,
                  color: state.color ?? Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Expanded(
                child: Center(
                  child: state.play == Play.loading
                      ? const CircularProgressIndicator()
                      : GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: state.size),
                          itemCount: state.size * state.size,
                          itemBuilder: (BuildContext context, int index) {
                            final onTap = state.play == Play.playing &&
                                    [
                                      state.blank - 1,
                                      state.blank + 1,
                                      state.blank - state.size,
                                      state.blank + state.size,
                                    ].contains(index)
                                ? () => context.read<PuzzleCubit>().update(index)
                                : null;
                            return state.puzzle[index] == 0
                                ? state.play == Play.finish
                                    ? const Card(
                                        margin: EdgeInsets.zero,
                                        child: Center(
                                          child: Text(
                                            "CLEAR!",
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink()
                                : state.type == PuzzleType.color
                                    ? ColorPuzzleTile(
                                        onTap: onTap,
                                        color: state.color?.withOpacity((1 / (state.size * state.size)) * (state.puzzle[index] + 1)),
                                      )
                                    : NumberPuzzleTile(
                                        onTap: onTap,
                                        number: state.puzzle[index],
                                      );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
