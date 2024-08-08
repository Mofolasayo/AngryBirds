import 'package:angry_birds/main.dart';
import 'package:flutter/material.dart';

class MusicToggle extends StatefulWidget {
  final MyGame game;

  const MusicToggle({required this.game, super.key});

  @override
  State<MusicToggle> createState() => _MusicToggleState();
}

class _MusicToggleState extends State<MusicToggle> {
  bool isMusicOn = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isMusicOn = !isMusicOn;
        });
        widget.game.toggleMusic(); 
      },
      icon: isMusicOn ? Icon(Icons.music_note) : Icon(Icons.music_off),
    );
  }
}
