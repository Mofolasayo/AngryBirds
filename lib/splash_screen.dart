import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _loadingProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    _controller.addListener(() {
      setState(() {
        _loadingProgress = _controller.value;
      });
    });
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
    /*  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return GameScreen();
    })); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Decorative background
          Image.asset(
            'assets/images/bg2.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the progress bar
            children: [
              // Title at the top
              Padding(
                padding: const EdgeInsets.only(bottom: 190.0),
                child: Text(
                  'Angry Birds',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'AngryBirds',
                    fontSize: MediaQuery.of(context).size.width * 0.1,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 247, 245, 245),
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
              // Loading bar
              Center(
                child: SizedBox(
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: _loadingProgress,
                      backgroundColor: Color.fromARGB(255, 255, 242, 58),
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                      minHeight: 20,
                    ),
                  ),
                ),
              ),
              // Loading text
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  'Loading...',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
