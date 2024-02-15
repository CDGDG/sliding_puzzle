import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_services/games_services.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PuzzleCubit()..shuffle()),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => Leaderboards.showLeaderboards(androidLeaderboardID: "CgkI6vLrr-kdEAIQAQ"), // TODO 개인정보처리방침
          ),
          FloatingActionButton(
            onPressed: () async => print(await GameAuth.isSignedIn),
            child: const Icon(Icons.person),
          ),
        ],
      ),
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
