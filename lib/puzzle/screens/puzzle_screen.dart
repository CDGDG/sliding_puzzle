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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200,
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: AnswerScreen(),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        child: ShuffleScreen(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            InfoScreen(),
            SizedBox(height: 16),
            Expanded(
              child: GameScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
