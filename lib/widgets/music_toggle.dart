import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MusicToggle extends StatefulWidget {
  const MusicToggle({super.key});

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
        },
        icon: isMusicOn ? Icon(Icons.music_note) : Icon(Icons.music_off));
  }
}
