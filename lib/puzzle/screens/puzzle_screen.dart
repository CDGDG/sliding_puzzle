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
          body: Container(
            color: Colors.blue.shade100,
            padding: const EdgeInsets.all(8.0),
            child: state.play == Play.loading
                ? const CircularProgressIndicator()
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
                    itemCount: size * size,
                    itemBuilder: (BuildContext context, int index) => state.puzzle[index] == 0
                        ? state.play == Play.finish
                            ? const Center(
                                child: Text("CLEAR"),
                              )
                            : const SizedBox.shrink()
                        : Material(
                            child: InkWell(
                              onTap: state.play == Play.playing &&
                                      [
                                        state.blank - 1,
                                        state.blank + 1,
                                        state.blank - size,
                                        state.blank + size,
                                      ].contains(index)
                                  ? () => context.read<PuzzleCubit>().update(index)
                                  : null,
                              child: Ink(
                                color: Colors.primaries[state.puzzle[index]],
                                child: Center(
                                  child: Text(
                                    "${state.puzzle[index]}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 5,
                                        )
                                      ],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
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
