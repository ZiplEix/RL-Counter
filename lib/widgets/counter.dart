import 'package:flutter/material.dart';
import 'package:rl_counter/widgets/neo_button.dart';
import 'package:rl_counter/widgets/score_representation.dart';

class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.add,
    required this.remove,
    required this.count,
    required this.title,
    required this.textColor,
  });

  final void Function() add;
  final void Function() remove;
  final String count;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(height: 15),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        NeoButton(
          onPressed: add,
          child: const Icon(
            Icons.keyboard_arrow_up_rounded,
            size: 50,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GestureDetector(
            onTap: add,
            child: ScoreRepresentation(
              backgroundColor: Colors.grey.shade200,
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 75,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
        ),
        NeoButton(
          onPressed: remove,
          child: const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 50,
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
