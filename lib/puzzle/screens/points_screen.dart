import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_services/games_services.dart';
import 'package:sliding_puzzle/auth/auth.dart';
import 'package:sliding_puzzle/commons/commons.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PuzzleCubit, PuzzleState>(
      builder: (context, state) => BlocBuilder<PointsCubit, PointsState>(
        builder: (context, pointsState) => Card(
          color: state.color.withOpacity(0.6),
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () => Leaderboards.showLeaderboards(androidLeaderboardID: androidLeaderboardID),
            borderRadius: BorderRadius.circular(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.leaderboard_rounded,
                  color: Colors.white,
                ),
                pointsState.maybeWhen(
                  loading: () => const CircularProgressIndicator(color: Colors.white),
                  unauthorized: () => Text(
                    "Guest",
                    style: TextStyle(
                      color: state.color,
                      fontSize: 30,
                    ),
                  ),
                  orElse: () => AnimatedFlipCounter(
                    value: pointsState.maybeWhen(
                      orElse: () => 0,
                      loaded: (points) => points,
                    ),
                    thousandSeparator: ",",
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
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
