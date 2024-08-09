import 'package:angry_birds/levels/level1.dart';
import 'package:angry_birds/levels/level2.dart';
import 'package:angry_birds/levels/level3.dart';
import 'package:angry_birds/levels/level4.dart';
import 'package:angry_birds/levels/level5.dart';
import 'package:angry_birds/levels/level6.dart';
import 'package:angry_birds/main.dart';
import 'package:flutter/material.dart';

class Levels extends StatelessWidget {
  // final int itemCount; // Total number of grid items
  final MyGame game;
  const Levels({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 300,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          childAspectRatio: 1.0, // Aspect ratio of each grid item
          crossAxisSpacing: 10.0, // Horizontal space between grid items
          mainAxisSpacing: 5.0, // Vertical space between grid items
        ),
        itemCount: 6, // Total number of items in the grid
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                game.loadLevel(Level1());
              } else if (index == 1) {
                game.loadLevel(Level2());
              } else if (index == 2) {
                game.loadLevel(Level3());
              } else if (index == 3) {
                game.loadLevel(Level4());
              } else if (index == 4) {
                game.loadLevel(Level5());
              } else if (index == 5) {
                game.loadLevel(Level6());
              }
            },
            child: Container(
              height: 50,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 34, 105, 131)
                    .withOpacity(0.5), // Background color of the container
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
