import 'package:flutter/material.dart';

class Levels extends StatelessWidget {
  // final int itemCount; // Total number of grid items

  const Levels({super.key});

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
          return Container(
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
          );
        },
      ),
    );
  }
}
