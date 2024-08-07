import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _startSplashScreenTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _startSplashScreenTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, _navigateToGame);
  }

  _navigateToGame() {
    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
    // return GameScreen(); // Transition to the game screen
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Decorative background
          Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              // Title at the top
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                  'Angry Birds',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'AngryBirds',
                    fontSize: MediaQuery.of(context).size.width *
                        0.1, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              // Loading bar
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.7, // 70% of screen width
                      child: LinearProgressIndicator(
                        value: _controller.value,
                        backgroundColor: Color.fromARGB(255, 255, 242, 58),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                        minHeight: 10,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
