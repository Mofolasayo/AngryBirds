import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(121, 85, 72, 0.637),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Row(
        children: [
          Text(
            'Score: ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            '1000',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
