import 'package:angry_birds/main.dart';
import 'package:flutter/material.dart';



class PausePlay extends StatefulWidget {
  final MyGame game;

  const PausePlay({super.key, required this.game});

  @override
  State<PausePlay> createState() => _PausePlayState();
}

class _PausePlayState extends State<PausePlay> {
  void _togglePauseOverlay() {
    widget.game.togglePause();
    if (widget.game.isPaused) {
      widget.game.overlays.add('PauseOverlay');
    } else {
      widget.game.overlays.remove('PauseOverlay');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _togglePauseOverlay,
      icon: widget.game.isPaused
          ? const Icon(Icons.play_arrow)
          : const Icon(Icons.pause),
    );
  }
}



