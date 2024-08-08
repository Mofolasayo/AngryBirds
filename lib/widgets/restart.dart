import 'package:flutter/material.dart';

class Restart extends StatefulWidget {
  // final MyGame game;
  const Restart({super.key});

  @override
  State<Restart> createState() => _RestartState();
}

class _RestartState extends State<Restart> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.restart_alt));
  }
}
