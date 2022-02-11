import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationContainer extends StatefulWidget {
  const AnimationContainer({Key? key}) : super(key: key);

  @override
  _AnimationContainerState createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  bool selected = false;
  Color value = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: value,
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          child: const Text("Animated Container",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}