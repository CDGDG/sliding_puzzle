import 'package:flutter/material.dart';

class PuzzleScreen extends StatelessWidget {
  const PuzzleScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const size = 4;

    return Scaffold(
      body: Container(
        color: Colors.blue.shade100,
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: size),
          children: List.generate(
            size * size,
            (index) => GestureDetector(
              child: Container(
                color: Colors.primaries[index],
                child: Center(
                  child: Text("${index + 1}"),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
