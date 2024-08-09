import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Welcome to Angry Birds!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Steeler"),
            ),
            SizedBox(height: 16),
            Text(
              'Here\'s how you can play the game:',
              style: TextStyle(fontSize: 18, fontFamily: "Steeler"),
            ),
            SizedBox(height: 16),
            Text(
              '1. Drag the bird backward on the slingshot to aim.',
              style: TextStyle(fontSize: 16, fontFamily: "Steeler"),
            ),
            SizedBox(height: 8),
            Text(
              '2. Release the bird to launch it toward the pigs.',
              style: TextStyle(fontSize: 16, fontFamily: "Steeler"),
            ),
            SizedBox(height: 8),
            Text(
              '3. Try to hit the pigs and structures to score points.',
              style: TextStyle(fontSize: 16, fontFamily: "Steeler"),
            ),
            SizedBox(height: 8),
            Text(
              '4. Each level has a limited number of birds, so aim carefully!',
              style: TextStyle(fontSize: 16, fontFamily: "Steeler"),
            ),
          ],
        ),
      ),
    );
  }
}
