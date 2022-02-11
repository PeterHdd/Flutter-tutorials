import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationOpacity extends StatefulWidget {
  const AnimationOpacity({Key? key}) : super(key: key);

  @override
  _AnimationOpacityState createState() => _AnimationOpacityState();
}

class _AnimationOpacityState extends State<AnimationOpacity> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        curve: Curves.easeInCubic,
        duration: const Duration(seconds: 2),
        opacity: opacity,
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                opacity = math.Random().nextDouble();
              });
            },
            child: const Text("Animated Opacity")),
      ),
    );
  }
}
