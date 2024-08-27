// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnimationPostioned extends StatefulWidget {
  const AnimationPostioned({Key? key}) : super(key: key);

  @override
  _AnimationPostionedState createState() => _AnimationPostionedState();
}

class _AnimationPostionedState extends State<AnimationPostioned> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        AnimatedPositioned(
            width: 200,
            height: 200,
            top: selected ? 50.0 : 150.0,
            duration: const Duration(seconds: 2),
            curve: Curves.bounceIn,
            child: Container(
              color: Colors.teal,
            )),
        Positioned(
            top: 20,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.teal)),
              onPressed: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: const Text("click me"),
            ))
      ],
    );
  }
}
