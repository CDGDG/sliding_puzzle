import 'package:flutter/material.dart';

class NumberPuzzleTile extends StatelessWidget {
  const NumberPuzzleTile({
    super.key,
    this.onTap,
    required this.number,
  });
  final void Function()? onTap;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      margin: const EdgeInsets.all(1),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Center(
          child: Text(
            "$number",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 20,
              shadows: const [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
