import 'package:angry_birds/screens/overlays/pause_overlay_screen.dart';
import 'package:flutter/material.dart';

class PausePlay extends StatefulWidget {
  const PausePlay({super.key});

  @override
  State<PausePlay> createState() => _PausePlayState();
}

class _PausePlayState extends State<PausePlay> {
  _showPauseOverlay(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PauseOverlay();
        });
  }

  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        
        setState(() {
          // isPaused = !isPaused;
        });
        _showPauseOverlay(context);
      },
      icon: isPaused ? const Icon(Icons.play_arrow) : const Icon(Icons.pause),
    );
  }
}
