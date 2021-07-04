import 'package:flutter/material.dart';

class InheritedWrapper extends StatefulWidget {
  final Widget child;
  InheritedWrapper({Key? key, required this.child}) : super(key: key);

  static InheritedWrapperState of(BuildContext context, {bool build = true}) {
    return build
        ? context.dependOnInheritedWidgetOfExactType<InheritedCounter>()!.data
        : context.findAncestorWidgetOfExactType<InheritedCounter>()!.data;
  }

  @override
  InheritedWrapperState createState() => InheritedWrapperState();
}

class InheritedWrapperState extends State<InheritedWrapper> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
        child: this.widget.child, data: this, counter: counter);
  }
}

class InheritedCounter extends InheritedWidget {
  InheritedCounter(
      {Key? key,
      required this.child,
      required this.data,
      required this.counter})
      : super(key: key, child: child);

  final Widget child;
  final int counter;
  final InheritedWrapperState data;

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) {
    return counter != oldWidget.counter;
  }
}
