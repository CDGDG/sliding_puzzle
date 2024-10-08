import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_puzzle/ad/ad.dart';
import 'package:sliding_puzzle/auth/auth.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PuzzleCubit()..shuffle()),
        BlocProvider(create: (context) => PointsCubit()..getPoints()),
        BlocProvider(create: (context) => AdCntCubit()),
        BlocProvider(create: (context) => AdLoadCubit()..init()),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        physics: const PageScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).viewPadding.top),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 8),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: PointsScreen(),
                            ),
                            SizedBox(height: 4),
                            Expanded(
                              child: ShuffleScreen(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              InfoScreen(),
              SizedBox(height: 8),
              GameScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
