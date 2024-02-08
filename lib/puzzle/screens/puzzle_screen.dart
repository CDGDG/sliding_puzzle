import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';
import 'package:sliding_puzzle/puzzle/screens/answer_screen.dart';

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
        final size = context.read<PuzzleCubit>().size;
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 2,
                                child: AnswerScreen(),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Card(
                                        margin: EdgeInsets.zero,
                                        child: InkWell(
                                          onTap: context.read<PuzzleCubit>().shuffle,
                                          child: const Icon(Icons.shuffle),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const GameScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}
