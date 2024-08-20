import 'package:conditional_parent_widget/conditional_parent_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
                const SizedBox(height: 32),
                Center(
                  child: state.play == Play.loading
                      ? const CircularProgressIndicator()
                      : GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: state.size,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                          ),
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
                                          child: Text(
                                            "CLEAR!",
                                            style: TextStyle(
                                              color: Theme.of(context).colorScheme.onPrimary,
                                              fontSize: state.size == 6 ? 14 : 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink()
                                : ConditionalParentWidget(
                                    condition: state.last == index,
                                    parentBuilder: (child) => Animate(
                                      effects: [
                                        SlideEffect(
                                          duration: const Duration(milliseconds: 50),
                                          curve: Curves.easeIn,
                                          begin: state.offset,
                                        ),
                                      ],
                                      child: child,
                                    ),
                                    child: switch (state.type) {
                                      PuzzleType.number => NumberPuzzleTile(
                                          onTap: onTap,
                                          index: state.puzzle[index],
                                          color: state.color,
                                          size: state.size * state.size,
                                        ),
                                      PuzzleType.color => ColorPuzzleTile(
                                          onTap: onTap,
                                          index: state.puzzle[index],
                                          color: state.color,
                                          size: state.size * state.size,
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
                                      PuzzleType.size => SizePuzzleTile(
                                          onTap: onTap,
                                          index: state.puzzle[index],
                                          color: state.color,
                                          size: state.size * state.size,
                                        ),
                                      // PuzzleType.count => CountPuzzleTile(
                                      //     onTap: onTap,
                                      //     index: state.puzzle[index],
                                      //     color: state.color,
                                      //     size: state.size * state.size,
                                      //     shape: state.countShape!,
                                      //   ),
                                    },
                                  );
                          },
                        ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
