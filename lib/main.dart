import 'package:flutter/material.dart';
import 'package:sliding_puzzle/commons/utils/fonts.dart';
import 'package:sliding_puzzle/puzzle/puzzle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliding Puzzle',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: Fonts.montserrat,
      ),
      home: const PuzzleScreen(),
    );
  }
}
