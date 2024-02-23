import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/auth/auth.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointsCubit, PointsState>(
      builder: (context, pointsState) => BlocConsumer<PuzzleCubit, PuzzleState>(
        listener: (context, state) {
          if (state.play == Play.clear) {
            context.read<PointsCubit>().increasePoints(
                  pointsState.maybeWhen(
                        orElse: () => 0,
                        loaded: (points) => points,
                      ) +
                      state.size * state.size,
                  isFirst: pointsState.whenOrNull(loaded: (points) => points == 0 ? true : null) ?? false,
                );
          }
        },
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
                    color: state.color,
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
                                      ([
                                            state.blank - state.size,
                                            state.blank + state.size,
                                          ].contains(index) ||
                                          (state.blank - 1 == index && state.blank % state.size != 0) ||
                                          (state.blank + 1 == index && index % state.size != 0))
                                  ? () => context.read<PuzzleCubit>().update(index)
                                  : null;
                              return state.puzzle[index] == 0
                                  ? state.play == Play.clear
                                      ? Card(
                                          margin: EdgeInsets.zero,
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: state.color,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: const Text(
                                              "CLEAR!",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink()
                                  : switch (state.type) {
                                      PuzzleType.number => NumberPuzzleTile(
                                          onTap: onTap,
                                          number: state.puzzle[index],
                                          color: state.color,
                                        ),
                                      PuzzleType.color => ColorPuzzleTile(
                                          onTap: onTap,
                                          color: state.color.withOpacity((1 / (state.size * state.size)) * (state.puzzle[index] + 1)),
                                        ),
                                      PuzzleType.line => LinePuzzleTile(
                                          onTap: onTap,
                                          index: state.puzzle[index],
                                          color: state.color,
                                          size: state.size * state.size,
                                        ),
                                      PuzzleType.stair => StairPuzzleTile(
                                          onTap: onTap,
                                          index: state.puzzle[index],
                                          color: state.color,
                                          size: state.size * state.size,
                                        ),
                                    };
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
