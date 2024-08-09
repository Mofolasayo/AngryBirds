import 'package:angry_birds/main.dart';
import 'package:flutter/material.dart';

class BackButtonOverlay extends StatelessWidget {
  final MyGame game;
  final String overlayname;

  const BackButtonOverlay({
    super.key,
    required this.game,
    required this.overlayname,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          game.backAction(overlayname);
        },
        child: Icon(Icons.arrow_back_ios_new_sharp));
  }
}
