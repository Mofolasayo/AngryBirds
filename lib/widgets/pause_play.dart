import 'package:angry_birds/main.dart';
import 'package:angry_birds/screens/overlays/pause_overlay_screen.dart';
import 'package:flutter/material.dart';



class PausePlay extends StatefulWidget {
  final MyGame game;

  const PausePlay({super.key, required this.game});

  @override
  State<PausePlay> createState() => _PausePlayState();
}

class _PausePlayState extends State<PausePlay> {
 
  void _showPauseOverlay(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PauseOverlay(game: widget.game);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.game.togglePause();
        setState(() {});
        _showPauseOverlay(context);
      },
      icon: widget.game.isPaused
          ? const Icon(Icons.play_arrow)
          : const Icon(Icons.pause),
    );
  }
}



