import 'package:flutter/material.dart';
import 'package:games_services/games_services.dart';
import 'package:sliding_puzzle/commons/utils/fonts.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GameAuth.signIn();

  runApp(const SlidingPuzzle());
}

class SlidingPuzzle extends StatelessWidget {
  const SlidingPuzzle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliding Puzzle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: Fonts.montserrat,
      ),
      home: const PuzzleScreen(),
    );
  }
}
