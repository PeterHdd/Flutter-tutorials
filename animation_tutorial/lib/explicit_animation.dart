import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({Key? key}) : super(key: key);

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with TickerProviderStateMixin {
      late final AnimationController _controller;
      late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller  = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controller.repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutQuad,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeTransition(
        opacity: _animation,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.network("assets/images/mario.png")),
      ),
    );
  }
}
