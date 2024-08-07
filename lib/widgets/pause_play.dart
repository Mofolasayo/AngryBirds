import 'package:flutter/material.dart';

class PausePlay extends StatefulWidget {
  const PausePlay({super.key});

  @override
  State<PausePlay> createState() => _PausePlayState();
}

class _PausePlayState extends State<PausePlay> {
  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPaused = !isPaused;
        });
      },
      icon: isPaused ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
    );
  }
}
