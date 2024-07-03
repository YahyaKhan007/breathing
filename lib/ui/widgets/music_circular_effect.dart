// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CircularPlayEffect extends StatefulWidget {
  const CircularPlayEffect({super.key});

  @override
  _CircularPlayEffectState createState() => _CircularPlayEffectState();
}

class _CircularPlayEffectState extends State<CircularPlayEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.green, Colors.orange, Colors.red],
              stops: [0.0, 0.33, 0.66, 1.0],
              tileMode: TileMode.mirror,
            ),
          ),
        ),
      ),
    );
  }
}
