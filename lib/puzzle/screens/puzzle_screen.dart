import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int size = 4;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PuzzleCubit(size)..shuffle()),
      ],
      child: const _PuzzleView(),
    );
  }
}

class _PuzzleView extends StatelessWidget {
  const _PuzzleView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) {
        int size = context.read<PuzzleCubit>().size;
        return Scaffold(
          body: Column(
            children: [
              const Expanded(
                child: SizedBox.shrink(),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(16),
                child: state.play == Play.loading
                    ? const CircularProgressIndicator()
                    : GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
                        itemCount: size * size,
                        itemBuilder: (BuildContext context, int index) {
                          final onTap = state.play == Play.playing &&
                                  [
                                    state.blank - 1,
                                    state.blank + 1,
                                    state.blank - size,
                                    state.blank + size,
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
                                      color: state.color?.withOpacity((1 / (size * size)) * (state.puzzle[index] + 1)),
                                    )
                                  : NumberPuzzleTile(
                                      onTap: onTap,
                                      number: state.puzzle[index],
                                    );
                        },
                      ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: context.read<PuzzleCubit>().shuffle,
            child: const Icon(Icons.shuffle),
          ),
        );
      },
    );
  }
}
