// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationText extends StatefulWidget {
  const AnimationText({Key? key}) : super(key: key);

  @override
  _AnimationTextState createState() => _AnimationTextState();
}

class _AnimationTextState extends State<AnimationText> {
  bool selected = false;

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
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          alignment:
              selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          child:  AnimatedDefaultTextStyle(duration: Duration(seconds: 1), style: TextStyle(color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)), curve: Curves.elasticInOut,
          child: Text("Animated Text",style: TextStyle(fontWeight: FontWeight.bold),),),
        ),
      ),
    );
  }
}