// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  Color targetColor = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
          curve: Curves.linearToEaseOut,
          tween: ColorTween(begin: Colors.green, end: targetColor),
          duration: Duration(seconds: 2),
          builder: (BuildContext context, Color? value, Widget? child) {
            return GestureDetector(
              child: Container(color: value),
              onTap: (() {
                setState(() {
                  if (value == Colors.green) {
                    targetColor = Colors.amber;
                  } else {
                    targetColor = Colors.green;
                  }
                });
              }),
            );
          }),
    );
  }
}
