import 'package:animation_tutorial/animation_container.dart';
import 'package:animation_tutorial/animation_opacity.dart';
import 'package:animation_tutorial/animation_positioned.dart';
import 'package:animation_tutorial/animation_text.dart';
import 'package:animation_tutorial/explicit_animation.dart';
import 'package:animation_tutorial/tween_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationTutorial());
}

class AnimationTutorial extends StatelessWidget {
  const AnimationTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                    child: Text(
                  "Container",
                  overflow: TextOverflow.clip,
                )),
                Tab(
                    child: Text(
                  "Text",
                  overflow: TextOverflow.clip,
                )),
                Tab(
                    child: Text(
                  "Opacity",
                  overflow: TextOverflow.clip,
                )),
                Tab(
                    child: Text(
                  "Positioned",
                  overflow: TextOverflow.clip,
                )),
                Tab(
                    child: Text(
                  "Tween",
                  overflow: TextOverflow.clip,
                )),
                Tab(
                    child: Text(
                  "Explicit",
                  overflow: TextOverflow.clip,
                )),
              ],
            ),
            title: const Text('Animation Tutorial'),
          ),
          body: const TabBarView(
            children: [
              AnimationContainer(),
              AnimationText(),
              AnimationOpacity(),
              AnimationPostioned(),
              TweenAnimation(),
              ExplicitAnimation()
            ],
          ),
        ),
      ),
    );
  }
}
