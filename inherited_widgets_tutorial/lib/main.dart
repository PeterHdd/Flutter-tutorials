import 'package:flutter/material.dart';

import 'inherited_counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return InheritedWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              WidgetB(),
              WidgetA(),
              WidgetC()
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetA extends StatefulWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  _WidgetAState createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text("Increment"));
  }

  onPressed() {
    InheritedWrapperState wrapper = InheritedWrapper.of(context);
    wrapper.incrementCounter();
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    print("widget B");
    return new Text('${state.counter}');
  }
}
 
class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final InheritedWrapperState state = InheritedWrapper.of(context,build : false);
        print("widget C");
    return new Text('I am Widget C');
  }
}
